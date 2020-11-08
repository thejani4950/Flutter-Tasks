import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:geolocator/geolocator.dart';

class Home extends StatefulWidget {
  static final String id = "Home";

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  String locationMessage = "";

  void getCurrentLocation() async {
    Position position =
        await getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(position);

    setState(() {
      locationMessage = "Latitude:" +
          "${position.latitude}" +
          "\n" +
          "Longitude:" +
          "${position.longitude}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE0E0E0E0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Text(
                "Location",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 20.0),
              child: Center(
                child: Text(locationMessage),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
