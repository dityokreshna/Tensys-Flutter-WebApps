import 'package:flutter/material.dart';
import 'package:tensys/home_page/body_contets/contents_grafik.dart';
import 'package:tensys/style/text_style.dart';

import 'body_contets/contents_heading.dart';

class HomeBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
        Container(
          margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: Text("APP HIPERTENSI", textAlign: TextAlign.center, style: MyDefaultTextStyle().texthead,)),
        ContentHeading(),
        Expanded(child: ContentGrafik())
      ],)
    );
  }
}