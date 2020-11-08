import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_flutter/Home.dart';
import 'package:login_flutter/todo_screen.dart';

class Signup_screen extends StatefulWidget {
  static final String id = "signup_screen";

  @override
  _Signup_screenState createState() => _Signup_screenState();
}

class _Signup_screenState extends State<Signup_screen> {
  final key_check = GlobalKey<FormState>();

  String username, email, password;
  String currentEmail;

  void _submit() async {
    if (key_check.currentState.validate()) {
      key_check.currentState.save();
      try {
        User user = (await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: username,
          password: password,
        ))
            .user;
        if (user != null) {
          Navigator.of(context).pushNamed(ToDoScreen.id);
        }
      } catch (e) {
        print(e);
      }
    }
  }

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
                  "Sign Up",
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
                  validator: (myInput) =>
                      myInput.trim().length < 3 ? '* Username Required' : null,
                  onSaved: (ui) => username = ui,
                ),
              ),
              // SizedBox(
              //   height: 5.0,
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(
              //       top: 20.0, bottom: 10.0, right: 20.0, left: 20.0),
              //   child: TextFormField(
              //     decoration: InputDecoration(
              //       border: OutlineInputBorder(
              //         borderRadius: BorderRadius.all(
              //           Radius.circular(10.0),
              //         ),
              //       ),
              //       hintText: 'Email',
              //     ),
              //     textAlign: TextAlign.start,
              //     validator: (myInput) =>
              //         !myInput.contains("@") ? '* Email Required' : null,
              //     onSaved: (ui) => email = ui,
              //   ),
              // ),
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
                      myInput.length < 7 ? '* Password Required' : null,
                  obscureText: true,
                  onSaved: (ui) => password = ui,
                ),
              ),
              OutlineButton(
                onPressed: _submit,
                child: Text('Sign Up'),
                textColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.0),
                  side: BorderSide(color: Colors.blue),
                ),
              ),
              OutlineButton(
                onPressed: () => Navigator.pop(context, Signup_screen.id),
                child: Text('Back to Login'),
                textColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.0),
                  side: BorderSide(color: Colors.blue),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
