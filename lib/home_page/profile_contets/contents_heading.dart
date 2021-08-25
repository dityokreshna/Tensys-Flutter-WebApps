import 'package:flutter/material.dart';
import 'package:tensys/home_page/history_contents/contents_heading.dart';
import 'package:tensys/style/color_style.dart';
import 'package:tensys/style/text_style.dart';

class ProfileHeading extends StatelessWidget {
  final String userName;
  ProfileHeading({required this.userName});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: MediaQuery.of(context).size.width,
      // decoration: BoxDecoration(color: Colors.yellow),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            bottom: 40,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                  color: MyColorStyle().headColor,
                  // border: Border.all(),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
            ),
          ),
          Positioned(
            child: Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Column(
                  children: <Widget>[
                    // Text(
                    //   "PROFIL",
                    //   textAlign: TextAlign.center,
                    //   style: MyDefaultTextStyle().texthead,
                    // ),
                    Container(
                      margin: EdgeInsets.all(10),
                      height: 75,
                      width: 75,
                      child: Image.asset('assets/images/default_user.png'),
                    ),
                    Text(
                      userName,
                      style: MyDefaultTextStyle().headline6,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.location_on_outlined,
                          size: 15,
                        ),
                        Text(
                          "Malang, Jawa Timur",
                          style: MyDefaultTextStyle().subtitle1,
                        )
                      ],
                    )
                  ],
                )),
          ),
          Positioned(
            right: 15,
            left: 15,
            bottom: 0,
            child: Center(child: ProfileHeadingContent()),
          )
        ],
      ),
    );
  }
}

class ProfileHeadingContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: 350,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black38,
              blurRadius: 2,
              offset: Offset(0, 0), // Shadow position
            ),
          ],
          // border: Border.all(),
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            child: Text(
              "Kondisi Tekanan Darah Terkini",
              style: MyDefaultTextStyle().subtitleHeading,
            ),
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              HeadingContent(
                nilai: "92",
                keterangan: "Denyut Nadi",
                heartColor: MyColorStyle().heartBeat,
              ),
              VerticalDivider(),
              HeadingContent(
                  nilai: "110",
                  keterangan: "Sistolik",
                  heartColor: MyColorStyle().sistolik),
              VerticalDivider(),
              HeadingContent(
                  nilai: "84",
                  keterangan: "Diastolik",
                  heartColor: MyColorStyle().diastolik),
            ],
          )
        ],
      ),
    );
  }
}
