import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login_flutter/Home.dart';

main() {
  runApp(FirstApp()); //stateless widget class
}

class FirstApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //basement
      // Material
      home: Screen(),
      routes: <String, WidgetBuilder>{
        '/Home': (BuildContext context) => new Home(),
      },
      //cement
    );
  }
}

class Screen extends StatefulWidget {
  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  final key_check = GlobalKey<FormState>();

  String username, password;
  String correct_username = "thejani";
  String correct_password = "12345";

  void _submit() {
    if (key_check.currentState.validate()) {
      key_check.currentState.save();
      // print(username);
      // print(password);

      checkValidation();
    }
  }

  void checkValidation() {
    if (username == correct_username && password == correct_password) {
      //if the username and password is corect
      Navigator.pushReplacementNamed(context, "/Home");
    } else {
      Fluttertoast.showToast(
          msg: "Username or Password is Incorrect! ",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.SNACKBAR,
          fontSize: 16.0);
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
                  validator: (myInput) =>
                      myInput.length < 3 ? '* Username Required' : null,
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
                onPressed: _submit,
                child: Text('Login'),
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
