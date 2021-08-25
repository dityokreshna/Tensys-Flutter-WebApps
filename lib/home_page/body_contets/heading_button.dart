import 'package:flutter/material.dart';
import 'package:tensys/home_page/info_kesehatan/info_kesehatan.dart';
import 'package:tensys/style/color_style.dart';

class HeadingButton extends StatefulWidget {
  final String isWeb;
  HeadingButton({required this.isWeb});
  @override
  _HeadingButtonState createState() => _HeadingButtonState();
}

class _HeadingButtonState extends State<HeadingButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      child: ElevatedButton(
          onPressed: () {
            setState(() {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return InfoKesehatan();
              }));
            });
          },
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.white))),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white)),
          child: Text("Info Kesehatan >",
              style: TextStyle(color: MyColorStyle().headColor))),
    );
  }
}
