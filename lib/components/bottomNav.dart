import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  // const BottomNav({ Key? key }) : super(key: key);

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      iconSize: 30,
      unselectedFontSize: 15,
      selectedFontSize: 15,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white,
      backgroundColor: Colors.redAccent,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.car_rental),
          title: Text("Create Offer"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.car_rental),
          title: Text("Ride Requests"),
        ),
      ],
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
    );
  }
}
