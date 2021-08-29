import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:phone_verification/screens/loggedInScreen.dart';
import 'package:phone_verification/screens/profileScreen.dart';
import 'package:phone_verification/route/route.dart';
import '../route/route.dart' as route;

import 'loginScreen.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;
var userName = '';

class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  void initState() {
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Theme.of(context).primaryColor,
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://st2.depositphotos.com/1104517/11965/v/600/depositphotos_119659092-stock-illustration-male-avatar-profile-picture-vector.jpg"),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Text(
                          userName,
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                  //Phone
                  ListTile(
                    leading: Icon(Icons.phone),
                    title: Text(
                      (_auth.currentUser.phoneNumber != null
                          ? _auth.currentUser.phoneNumber
                          : ''),
                    ),
                    // Text('Phone: ' +
                    //     (_auth.currentUser.phoneNumber != null
                    //         ? _auth.currentUser.phoneNumber
                    //         : '') +

                    // ' ID: ' +
                    // (_auth.currentUser.uid != null
                    //     ? _auth.currentUser.uid
                    //     : '') +
                  ),
                  //Account
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text(
                      ("My Account"),
                    ),
                  ),
                  //Account
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text(
                      ("Settings"),
                    ),
                  ),

                  Divider(
                    color: Colors.black,
                  ),

                  ElevatedButton(
                    onPressed: () => {
                      //sign out
                      signOut()
                    },
                    child: Text('Sign out'),
                  ),
                  ElevatedButton(
                    onPressed: () => {},
                    child: Text('Switch Mode'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  signOut() {
    //redirect
    _auth.signOut().then((value) => Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) => LoginScreen())));
  }

  Future getUser() async {
    if (_auth.currentUser != null) {
      var cellNumber = _auth.currentUser.phoneNumber;
      cellNumber =
          '0' + _auth.currentUser.phoneNumber.substring(3, cellNumber.length);
      debugPrint(cellNumber);
      await _firestore
          .collection('users')
          .where('cellnumber', isEqualTo: cellNumber)
          .get()
          .then((result) {
        if (result.docs.length > 0) {
          setState(() {
            userName = result.docs[0].data()['name'];
          });
        }
      });
    }
  }
}
