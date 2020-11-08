//import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:login_flutter/add_task_screen.dart';
import 'package:login_flutter/edit_task.dart';
import 'package:login_flutter/login_screen.dart';
import 'package:login_flutter/models/task_model.dart';

class ToDoScreen extends StatefulWidget {
  static final String id = "todo_screen";
  @override
  _ToDoScreenState createState() => _ToDoScreenState();
}

String uid = FirebaseAuth.instance.currentUser.uid;
DatabaseReference dbRef =
    FirebaseDatabase.instance.reference().child("todo").child(uid);

class _ToDoScreenState extends State<ToDoScreen> {
  //String uid = FirebaseAuth.instance.currentUser.uid;
  //DatabaseReference dbRef = FirebaseDatabase.instance.reference().child('todo');

  deleteButton() {}

  Widget buildTask(int index) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        children: [
          ListTile(
            title: Text("Task Title"),
            subtitle: Text("Oct 30, 2019"),
            trailing: Checkbox(
              onChanged: (value) {
                print(value);
              },
              value: true,
              activeColor: Colors.blue,
            ),
          ),
          Divider(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          title: Text("My Tasks",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              )),
          actions: [
            IconButton(
              icon: Icon(
                Icons.logout,
                color: Colors.white,
              ),
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushReplacementNamed(context, Login_screen.id);
              },
            )
          ],
        ),
        backgroundColor: Color(0xFFE0E0E0E0),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          child: Icon(Icons.add),
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (_) => AddTask_screen())),
        ),
        body: StreamBuilder(
          stream: dbRef.onValue,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }

            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: FirebaseAnimatedList(
                  shrinkWrap: true,
                  query: dbRef,
                  itemBuilder: (BuildContext context, DataSnapshot snapshot,
                      Animation<double> animation, int index) {
                    return ListTile(
                      trailing: Container(
                        child: Column(
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.delete_outline,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                dbRef.child(snapshot.key).remove();
                              },
                              // trailing: Checkbox(
                              //   onChanged: (value) {
                              //     dbRef.child(snapshot.key).remove();
                              //   },
                              // value: true,
                              // activeColor: Colors.blue,
                            ),
                          ],
                        ),
                      ),
                      title: Text(snapshot.value["title"]),
                      subtitle: Text(snapshot.value["date"]),
                    );
                  }),
            );
          },
        ));
  }
}
//           },
//         ));
//   }
// }
