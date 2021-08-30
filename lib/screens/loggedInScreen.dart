import 'package:flutter/material.dart';
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
            Text("Chalo"),
          ],
        ),
      ),
      drawer: MainDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [Center(child: Text("You are on a homepage."))],
        ),
      ),
    );
  }
}
