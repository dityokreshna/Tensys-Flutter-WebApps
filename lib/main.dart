import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'login_page/login.dart';

void main() => runApp(TensysApp());

class TensysApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        // Check for errors

        print(snapshot);
        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: 
            // InfoKesehatan(),
            // HomePage(),
            LoginScreen()
          );
        } else if (snapshot.hasError) {
          print("Error");
        }
        // Otherwise, show something whilst waiting for initialization to complete
        return CircularProgressIndicator();
      },
    );
  }
}
