import 'package:flutter/material.dart';
import 'package:tensys/home_page/body_contets/heading_button.dart';
import 'package:tensys/style/color_style.dart';
import 'package:tensys/style/text_style.dart';

class ContentHeading extends StatelessWidget {
  final String userName;
  final String isWeb;
  ContentHeading({required this.userName, required this.isWeb});
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(5, 0, 5, 10),
        height: 160,
        // decoration: BoxDecoration(color: Colors.blue),
        alignment: Alignment.center,
        child: Container(
          height: 150,
          width: 330,
          // decoration: BoxDecoration(color: Colors.yellow),
          child: Stack(
            children: <Widget>[
              Positioned(
                  bottom: 0,
                  left: 0,
                  top: 30,
                  child: Container(
                    width: 330,
                    decoration: BoxDecoration(
                        color: MyColorStyle().headColor,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black38,
                            blurRadius: 2,
                            offset: Offset(0, 0), // Shadow position
                          ),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                  )),
              Positioned(
                left: 150,
                top: 30,
                right: 0,
                bottom: 0,
                child: Container(
                  height: 150,
                  width: 300,
                  padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                  decoration: BoxDecoration(color: Colors.transparent),
                  // width: MediaQuery.of(context).size.width * 0.9,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        "Hi, "+this.userName.toUpperCase(),
                        style: MyDefaultTextStyle().subtitle1,
                      ),
                      Text('Kami bisa cek kondisi tekanan darahmu disini', style: MyDefaultTextStyle().subtitle2),
                      HeadingButton(isWeb: isWeb,)
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: -15,
                top: 0,
                child: Image(image: AssetImage('assets/images/doctor.png'),),
              ),
            ],
          ),
        ));
  }
}
