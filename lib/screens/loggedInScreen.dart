import 'package:flutter/material.dart';
import 'package:phone_verification/screens/googleMap.dart';
import 'package:phone_verification/screens/main_drawer.dart';

class LoggedInScreen extends StatefulWidget {
  LoggedInScreen({Key key}) : super(key: key);

  @override
  _LoggedInScreenState createState() => _LoggedInScreenState();
}

class _LoggedInScreenState extends State<LoggedInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Chalo Captain"),
          ],
        ),
      ),
      drawer: MainDrawer(),
      body: MapSample(),
    );
  }
}
