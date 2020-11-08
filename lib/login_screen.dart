import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login_flutter/todo_screen.dart';
import 'package:login_flutter/signup_screen.dart';

class Login_screen extends StatefulWidget {
  static final String id = "login_screen";

  @override
  _Login_screenState createState() => _Login_screenState();
}

class _Login_screenState extends State<Login_screen> {
  final key_check = GlobalKey<FormState>();

  String username, password;

  submitForm() {
    _submit();
  }

  void _submit() async {
    //await Firebase.initializeApp();
    if (key_check.currentState.validate()) {
      key_check.currentState.save();
      // checkValidation();
      try {
        User user = (await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: username,
          password: password,
        ))
            .user;
        if (user != null) {
          Navigator.of(context).pushNamed(ToDoScreen.id);
        }
      } catch (e) {
        print(e);
        Fluttertoast.showToast(
            msg: e,
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.SNACKBAR,
            fontSize: 16.0);
      }
    }
  }

  // void checkValidation() async {
  //   try {
  //     User user = (await FirebaseAuth.instance.signInWithEmailAndPassword(
  //       email: username,
  //       password: password,
  //     ))
  //         .user;
  //     if (user != null) {
  //       Navigator.of(context).pushNamed(ToDoScreen.id);
  //     }
  //   } catch (e) {
  //     print(e);
  //     Fluttertoast.showToast(
  //         msg: e,
  //         toastLength: Toast.LENGTH_LONG,
  //         gravity: ToastGravity.SNACKBAR,
  //         fontSize: 16.0);
  //   }
  //}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFE0E0E0E0),
        body: Center(
          child: Form(
            key: key_check,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: SizedBox(
                    height: 120.0,
                    child: Image.asset(
                      "images/logo.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 20.0, bottom: 10.0, right: 20.0, left: 20.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      hintText: 'Username',
                    ),
                    textAlign: TextAlign.start,
                    validator: (myInput) => myInput.trim().length < 3
                        ? '* Username Required'
                        : null,
                    onSaved: (ui) => username = ui,
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10.0, bottom: 25.0, right: 20.0, left: 20.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      hintText: 'Password',
                    ),
                    textAlign: TextAlign.start,
                    validator: (myInput) =>
                        myInput.length < 3 ? '* Password Required' : null,
                    obscureText: true,
                    onSaved: (ui) => password = ui,
                  ),
                ),
                OutlineButton(
                  onPressed: () {
                    submitForm();
                  },
                  child: Text('Login'),
                  textColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14.0),
                    side: BorderSide(color: Colors.blue),
                  ),
                ),
                OutlineButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, Signup_screen.id),
                  child: Text('Go to Signup'),
                  textColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14.0),
                    side: BorderSide(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
