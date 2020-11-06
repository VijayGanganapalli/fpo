import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'file:///E:/Develop/fpo/lib/util/constants/constants.dart';

import 'home_screen.dart';
import 'login_screen.dart';

class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Initialization of the firebase app
    final Future<FirebaseApp> _initialization = Firebase.initializeApp();

    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        // If snapshot has error
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text("Error: ${snapshot.error}"),
            ),
          );
        }
        // Connection initialized - Firebase app running
        if (snapshot.connectionState == ConnectionState.done) {
          return StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, streamSnapshot) {
              // If stream snapshot has error
              if (streamSnapshot.hasError) {
                return Scaffold(
                  body: Center(
                    child: Text("Error: ${streamSnapshot.error}"),
                  ),
                );
              }
              // Connection state active - user login check inside the if statement
              if (streamSnapshot.connectionState == ConnectionState.active) {
                // Get the user
                User _user = streamSnapshot.data;
                // Checking the user login or not
                if (_user == null) {
                  // User not login - login screen
                  return LogInScreen();
                } else {
                  // User already login - home screen
                  return HomeScreen();
                }
              }
              // Checking the auth state - loading
              return Scaffold(
                body: Center(
                  child: Text(
                    "Checking authentication...",
                    style: Constants.regularHeading,
                  ),
                ),
              );
            },
          );
        }
        // Connecting to firebase app - loading
        return Scaffold(
          body: Center(
            child: Text(
              "Initializing the app...",
              style: Constants.regularHeading,
            ),
          ),
        );
      },
    );
  }
}
