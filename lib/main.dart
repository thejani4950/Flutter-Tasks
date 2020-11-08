import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_flutter/Home.dart';
import 'package:login_flutter/todo_screen.dart';
import 'package:login_flutter/login_screen.dart';
import 'package:login_flutter/signup_screen.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final FirebaseApp app = await Firebase.initializeApp(
    name: 'db2',
    options: Platform.isIOS || Platform.isMacOS
        ? FirebaseOptions(
            appId: '1:189283388772:ios:64907da9bd97f11aa0be71', //
            apiKey: 'AIzaSyBSwB3iDnheidMjfZd6B0IUE51vlRlH0yk',
            projectId: 'flutter-task-acdd5',
            messagingSenderId: '189283388772',
            databaseURL: 'https://flutter-task-acdd5.firebaseio.com',
          )
        : FirebaseOptions(
            appId: '1:424996282790:android:29df8e39f99126b48faf67', //
            apiKey: 'AIzaSyDVfe8vyss7Lbos-KD6GDOSMpzV-tN3Hxk', //
            messagingSenderId: '424996282790', //
            projectId: 'flutter-task-dd028', //
            databaseURL: 'https://flutter-task-dd028.firebaseio.com', //
          ),
  );

  runApp(MyFirstApp());
}

class MyFirstApp extends StatelessWidget {
  // final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  // Widget getScreenId() {
  //   return FutureBuilder(
  //       //stream: FirebaseAuth.instance.authStateChanges(),
  //       future: _initialization,
  //       builder: (BuildContext context, snapshot) {
  //         if (snapshot.hasData) {
  //           return ToDoScreen();
  //         } else {
  //           return Login_screen();
  //         }
  //       });
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //basement
      // Material
      home: getScreen(),
      routes: {
        Login_screen.id: (context) => Login_screen(),
        Signup_screen.id: (context) => Signup_screen(),
        Home.id: (context) => Home(),
        ToDoScreen.id: (context) => ToDoScreen(),
      },

      //cement
    );
  }

  Widget getScreen() {
    if (FirebaseAuth.instance.currentUser != null) {
      return ToDoScreen();
    } else {
      return Login_screen();
    }
  }
}

// var routes = <String, WidgetBuilder>{
//    '/Home': (context) =>  Home(),
//     '/Register':(context) => Register(),
//     '/Login':(context) =>  Login(),
//     '/TaskPage':(context)=> TaskPage(),

// };

//}
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//     title: 'Named Routes Demo',
//     // Start the app with the "/" named route. In this case, the app starts
//     // on the FirstScreen widget.
//     initialRoute: '/',
//     routes: {
//       // When navigating to the "/" route, build the FirstScreen widget.
//       '/': (context) => Login(),
//       // When navigating to the "/second" route, build the SecondScreen widget.
//       '/Home': (context) =>  Home(),
//     '/Register':(context) => Register(),
//     '/Login':(context) =>  Login(),
//     },
//   );
//   }
// }

// var routes = <String, WidgetBuilder>{
//   "/auth": (BuildContext context) => AuthScreen(),
//   "/home":(BuildContext context) => HomeScreen(),
// };

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         theme: ThemeData(
//           primaryColor: Colors.blue
//         ),
//       home: Login(),
//       initialRoute: '/',
//       routes: <String, WidgetBuilder>{
//         '/': (context) => Login(),
//     '/Home': (context) =>  Home(),
//     '/Register':(context) => Register(),
//     '/Login':(context) =>  Login(),
//   },
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         theme: ThemeData(
//           primaryColor: Colors.blue
//         ),
//       home: Login(),
//       routes: <String, WidgetBuilder>{
//     '/Home': (BuildContext context) => new Home(),
//     '/Register':(BuildContext context) => new Register(),
//     '/Login':(BuildContext context) => new Login(),
//   },
//     );
//   }
// }

// import 'dart:io';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:login_flutter/Home.dart';
// import 'package:login_flutter/todo_screen.dart';
// import 'package:login_flutter/login_screen.dart';
// import 'package:login_flutter/signup_screen.dart';
// import 'package:firebase_core/firebase_core.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     name: 'db2',
//     options: Platform.isIOS || Platform.isMacOS
//         ? FirebaseOptions(
//             appId: '1:189283388772:ios:64907da9bd97f11aa0be71',
//             apiKey: 'AIzaSyBSwB3iDnheidMjfZd6B0IUE51vlRlH0yk',
//             projectId: 'flutter-task-acdd5',
//             messagingSenderId: '189283388772',
//             databaseURL: 'https://flutter-task-acdd5.firebaseio.com',
//           )
//         : FirebaseOptions(
//             appId: '1:297855924061:android:669871c998cc21bd',
//             apiKey: 'AIzaSyD_shO5mfO9lhy2TVWhfo1VUmARKlG4suk',
//             messagingSenderId: '297855924061',
//             projectId: 'flutter-firebase-plugins',
//             databaseURL: 'https://flutterfire-cd2f7.firebaseio.com',
//           ),
//   );
//   runApp(FirstApp());
// }
// // main()  {
// //   runApp(FirstApp());
// //   //stateless or statefull widget class
// // }

// class FirstApp extends StatelessWidget {
//   final Future<FirebaseApp> _initialization = Firebase.initializeApp();
//   Widget getScreenId() {
//     return FutureBuilder(
//         //stream: FirebaseAuth.instance.authStateChanges(),
//         future: _initialization,
//         builder: (BuildContext context, snapshot) {
//           if (snapshot.hasData) {
//             return ToDoScreen();
//           } else {
//             return Login_screen();
//           }
//         });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       //basement
//       // Material
//       home: getScreenId(),
//       routes: {
//         Login_screen.id: (context) => Login_screen(),
//         Signup_screen.id: (context) => Signup_screen(),
//         Home.id: (context) => Home(),
//         ToDoScreen.id: (context) => ToDoScreen(),
//       },

//       //cement
//     );
//   }
// }
