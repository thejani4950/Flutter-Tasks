import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:login_flutter/todo_screen.dart';

class EditTask_screen extends StatefulWidget {
  static final String id = "edit_task_screen";
  @override
  _EditTask_screenState createState() => _EditTask_screenState();
}

class _EditTask_screenState extends State<EditTask_screen> {
  final formKey = GlobalKey<FormState>();
  String title;
  DateTime _date = DateTime.now();
  TextEditingController dateController = TextEditingController();

  final DateFormat dateFormatter = DateFormat("MMM dd, yyyy");

  @override
  void initState() {
    super.initState();
    dateController.text = dateFormatter.format(_date);
  }

  @override
  void dispose() {
    dateController.dispose();
    super.dispose();
  }

  handleDatePicker() async {
    final DateTime date = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (date != null && date != _date) {
      setState(() {
        _date = date;
      });
      dateController.text = dateFormatter.format(date);
    }
  }

  updateClick() {
    update();
  }

  update() async {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      print(title);
      print(_date);

      String uid = FirebaseAuth.instance.currentUser.uid;
      DatabaseReference dbRef =
          FirebaseDatabase.instance.reference().child("todo").child(uid);

      String id = dbRef.key;

      await dbRef.reference().child(id).update({
        'id': id,
        'title': title,
        'date': dateController.text,
        'status': "completed", // incompleted
      }).then((onValue) {
        print("success");
        Navigator.pushNamed(context, ToDoScreen.id);
      }).catchError((onError) {
        print(onError);
        // return false;
      });
    }
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE0E0E0E0),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 80.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 30.0,
                      color: Colors.black,
                    )),
                SizedBox(height: 20.0),
                Text(
                  "Edit Task",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.0),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          style: TextStyle(fontSize: 18.0),
                          decoration: InputDecoration(
                            labelText: "Title",
                            labelStyle: TextStyle(fontSize: 18.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          validator: (input) => title = input.trim().isEmpty
                              ? "Please enter a task title"
                              : null,
                          onSaved: (input) => title = input,
                          initialValue: title,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          readOnly: true,
                          controller: dateController,
                          style: TextStyle(fontSize: 18.0),
                          onTap: handleDatePicker,
                          decoration: InputDecoration(
                            labelText: "Date",
                            labelStyle: TextStyle(fontSize: 18.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 20.0),
                        height: 60.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: FlatButton(
                          child: Text(
                            "Update",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.0),
                          ),
                          onPressed: () {
                            updateClick();
                          },
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
