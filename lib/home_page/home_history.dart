import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:tensys/style/text_style.dart';
import 'history_contents/contents_grafik.dart';
import 'history_contents/contents_heading.dart';

class HomeHistory extends StatelessWidget {
  final List<FlSpot> dataDetak;
  final List<FlSpot> dataSistolik;
  final List<FlSpot> dataDiastolik;
  final String isWeb;
  HomeHistory(
      {required this.dataDetak,
      required this.dataSistolik,
      required this.dataDiastolik,
      required this.isWeb});
  @override
  Widget build(BuildContext context) {
    return Container(
        // width: 350,
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            HistoryHeading(),
            Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.fromLTRB(15, 10, 15, 0),
                padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Text(
                  "Grafik Data",
                  style: MyDefaultTextStyle().headline6,
                  textAlign: TextAlign.left,
                )),
            Expanded(
              child: HistoryContent(
                dataDetak: this.dataDetak,
                dataDiastolik: this.dataDiastolik,
                dataSistolik: this.dataSistolik,
                isWeb: this.isWeb,
              ),
            ),
          ],
        ));
  }
}
