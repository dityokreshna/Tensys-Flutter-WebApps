import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:tensys/style/text_style.dart';

class ContentGrafik extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 4,
              offset: Offset(0, 0), // Shadow position
            ),
          ],
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[GrafikHeading(), Expanded(child: GrafikData())]),
    );
  }
}

class GrafikHeading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
      alignment: Alignment.centerLeft,
        // decoration: BoxDecoration(color: Colors.yellow),
        child: Text("Grafik Kesehatan", style: MyDefaultTextStyle().texth1,));
  }
}

class GrafikData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 325,
        decoration: BoxDecoration(color: Colors.transparent),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            DataCard(detailTextHead: "Detak Jantung"),
            DataCard(detailTextHead: "Sistolik"),
            DataCard(detailTextHead: "Diastolik")
          ],
        ));
  }
}

class DataCard extends StatelessWidget {
  final String detailTextHead;
  DataCard({required this.detailTextHead});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 325,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 4,
              offset: Offset(0, 0), // Shadow position
            ),
          ],
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.white),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(5),
            height: 90,
            child: CircularPercentIndicator(
              startAngle: 180,
              radius: 90.0,
              animation: true,
              animationDuration: 1200,
              lineWidth: 10.0,
              percent: 0.4,
              center: new Text(
                "40",
                style: MyDefaultTextStyle().texth1,
              ),
              circularStrokeCap: CircularStrokeCap.round,
              backgroundColor: Colors.transparent,
              progressColor: Colors.blue,
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10),
              height: 100,
              // decoration: BoxDecoration(color: Colors.pink),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(this.detailTextHead, style:MyDefaultTextStyle().texth2),
                  Text("Rekomendasfffewfewfewgewgewgegewgewgewgegwggegwegewi")
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
