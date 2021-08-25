import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tensys/style/text_style.dart';

import '../splash_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.blue,
                Colors.white,
                Colors.white,
                HexColor("#feca0d")
              ],
            )),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
                child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black38,
                      blurRadius: 2,
                      offset: Offset(0, 0), // Shadow position
                    ),
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              alignment: Alignment.center,
              height: 300,
              width: 325,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      "assets/images/logo_tensys.png",
                      width: 200,
                    ),
                  ),
                  Form(
                      child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            labelText: 'Email',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                            controller: _passController,
                            obscureText: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              labelText: 'Password',
                            )),
                      )
                    ],
                  )),
                  ElevatedButton(
                    onPressed: () {
                      if (_emailController.text == "tensys.pkm@um.ac.id" &&
                          _passController.text == "tensys123") {
                        _emailController.clear();
                        _passController.clear();
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return SplashScreen();
                        }));
                      } else {
                        _emailController.clear();
                        _passController.clear();
                        final snackBar = SnackBar(
                          content: const Text('Email atau Password salah'),
                          action: SnackBarAction(
                            label: 'Kembali',
                            onPressed: () {
                              // Some code to undo the change.
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                return LoginScreen();
                              }));
                            },
                          ),
                        );

                        // Find the ScaffoldMessenger in the widget tree
                        // and use it to show a SnackBar.
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                    child: Text(
                      "LOGIN",
                      style: MyDefaultTextStyle().button,
                    ),
                  )
                ],
              ),
            )),
          ),
        ],
      ),
    );
  }
}
