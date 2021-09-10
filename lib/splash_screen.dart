import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tensys/style/text_style.dart';

import 'home_page/home_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
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
            )
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: Container(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "assets/images/logo_tensys.png",
                    width: 300,
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Text(
                      "Tensimeter and Self Detection System",
                      style: MyDefaultTextStyle().subtitle1,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                        onPressed: () {
                          setState(() {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return HomePage();
                            }));
                          });
                        },
                        child: Text("START")),
                  )
                ],
              )),
            ),
          ),
        ],
      ),
    );
  }
}
