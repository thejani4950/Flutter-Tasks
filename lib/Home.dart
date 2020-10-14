import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Welcome to Home'),
      ),
    );
  }
}
