import 'package:flutter/material.dart';
import 'package:phone_verification/screens/loginScreen.dart';
import 'package:phone_verification/main.dart';
import 'package:phone_verification/screens/profileScreen.dart';

const String loginPage = 'loginScreen';
const String homePage = 'main';
const String profilePage = 'profileScreen';

Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case loginPage:
      return MaterialPageRoute(builder: (context) => LoginScreen());
    case homePage:
      return MaterialPageRoute(builder: (context) => App());
    case profilePage:
      return MaterialPageRoute(builder: (context) => Profile());
    default:
      throw ('This route does not exist');
  }
}
