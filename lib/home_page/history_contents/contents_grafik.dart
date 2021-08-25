import 'package:flutter/material.dart';
import 'package:tensys/style/color_style.dart';
import 'package:tensys/style/text_style.dart';
import 'package:fl_chart/fl_chart.dart';

// ignore: must_be_immutable
class HistoryContent extends StatelessWidget {
  final List<FlSpot> dataDetak;
  final List<FlSpot> dataSistolik;
  final List<FlSpot> dataDiastolik;
  final String isWeb;
  HistoryContent(
      {required this.dataDetak,
      required this.dataSistolik,
      required this.dataDiastolik,
      required this.isWeb});
  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.fromLTRB(15, 10, 15, 15),
      padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
      alignment: Alignment.centerLeft,
      child: ListView(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          _chartData(
              context, "Denyut Nadi", dataDetak, MyColorStyle().heartBeat),
          _chartData(
              context, "Sistolik", dataSistolik, MyColorStyle().sistolik),
          _chartData(
              context, "Diastolik", dataDiastolik, MyColorStyle().diastolik),
        ],
      ),
    );
  }

  Container _chartData(
      context, String namaChart, List<FlSpot> dataList, Color boxColor) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
      // width: MediaQuery.of(context).size.width * 0.7,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black38,
              blurRadius: 2,
              offset: Offset(0, 0), // Shadow position
            ),
          ],
          border: Border.all(color: boxColor),
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(8.0),
              child: Text(
            namaChart,
            style: MyDefaultTextStyle().headline6,
          )),
          Container(
            height: 175,
            width: MediaQuery.of(context).size.width * 0.85,
            child: Padding(
              padding: const EdgeInsets.only(
                  right: 15.0, left: 10.0, top: 15.0, bottom: 3.0),
              child: LineChart(
                mainData(dataList, boxColor),
              ),
            ),
          ),
        ],
      ),
    );
  }

  LineChartData mainData(List<FlSpot> dataList, Color myColor) {
    double myx = 0;
    double myxmin = dataDetak.first.x;
    dataDetak.forEach((element) {
      if (element.x > myx) {
        myx = element.x;
      } else {
        myx = myx;
      }
      if (element.x < myxmin) {
        myxmin = element.x;
      } else {
        myxmin = myxmin;
      }
    });
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        // getDrawingHorizontalLine: (value) {
        //   return FlLine(
        //     color: const Color(0xff37434d),
        //     strokeWidth: 1,
        //   );
        // },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          getTextStyles: (value) => const TextStyle(
              color: Color(0xff68737d),
              fontWeight: FontWeight.bold,
              fontSize: 9),
          getTitles: (value) {
            return value.toInt().toString();
          },
          margin: 3,
        ),
        leftTitles: SideTitles(
          interval: 20,
          showTitles: true,
          getTextStyles: (value) => const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 9,
          ),
          getTitles: (value) {
            return value.toInt().toString();
          },
          reservedSize: 12,
          margin: 12,
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 0.2)),
      minX: myxmin,
      maxX: myx,
      minY: 0,
      maxY: 200,
      lineBarsData: [
        LineChartBarData(
          spots: dataList,
          isCurved: true,
          colors: [myColor],
          barWidth: 2,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: true,
          ),
          // belowBarData: BarAreaData(
          //   show: true,
          //   colors:
          //       gradientColors.map((color) => color.withOpacity(0.3)).toList(),
          // ),
        ),
      ],
    );
  }
}

// _keterangan(Color colorKeterangan) {
//   return Container(
//     child: Row(
//       children: [
//         Icon(
//           Icons.circle,
//           color: colorKeterangan,
//         ),
//         Text("sistolik")
//       ],
//     ),
//   );
// }

class Keterangan extends StatelessWidget {
  final Color colorKeterangan;
  final String myText;
  Keterangan({required this.colorKeterangan, required this.myText});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Icon(
            Icons.circle,
            color: colorKeterangan,
          ),
          Text(myText, style: MyDefaultTextStyle().subtitle2)
        ],
      ),
    );
  }
}
