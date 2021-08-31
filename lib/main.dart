import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'route/route.dart' as route;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

// API KEY (AIzaSyDgJX3fH60Yq-4mD2jLrKkpn37lk76s44c)

class App extends StatelessWidget {
  // Create the initialization Future outside of `build`:
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Center(
            child: Text('Could not load app'),
          );
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            title: 'Phone Verification',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                primaryColor: Colors.yellow,
                primarySwatch: Colors.yellow,
                inputDecorationTheme: InputDecorationTheme(
                    labelStyle: TextStyle(color: Colors.grey)),
                backgroundColor: Colors.white),

            onGenerateRoute: route.controller,
            initialRoute: route.loginPage,

            // initialRoute: "/profile",
            // routes: {
            //   "/": (context) => LoginScreen(),
            //   "/profile": (context) => Profile(),
            // },
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(
                    backgroundColor: Theme.of(context).primaryColor,
                  )
                ],
              ),
            ]);
      },
    );
  }
}
