import 'package:flutter/material.dart';
import 'package:tensys/style/color_style.dart';
import 'package:tensys/style/text_style.dart';

class HistoryHeading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
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
          // Positioned(
          //   child: Container(
          //       alignment: Alignment.topCenter,
          //       margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
          //       child: Column(
          //         children: <Widget>[
          //           Text(
          //             "RIWAYAT",
          //             textAlign: TextAlign.center,
          //             style: MyDefaultTextStyle().texthead, 
          //           ),
          //         ],
          //       )),
          // ),
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
                border: Border.all(color: MyColorStyle().sistolik, width: 1),

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
              "Riwayat Pengukuran Tekanan Darah",
              style: MyDefaultTextStyle().subtitleHeading,
            ),
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              HeadingContent(nilai: "92",keterangan: "Denyut Nadi",heartColor: MyColorStyle().heartBeat,),
              VerticalDivider(),
              HeadingContent(nilai: "110",keterangan: "Sistolik",heartColor: MyColorStyle().sistolik),
              VerticalDivider(),
              HeadingContent(nilai: "84",keterangan: "Diastolik",heartColor: MyColorStyle().diastolik),
            ],
          )
        ],
      ),
    );
  }
}

class HeadingContent extends StatelessWidget {
  final String nilai;
  final String keterangan;
  final Color heartColor;
  HeadingContent({required this.nilai,required this.keterangan, required this.heartColor});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(5),
            height: 20,
            width: 20,
                child: Image(image: AssetImage('assets/images/heartbeat.png'),color: heartColor,),            
            // child: Image.asset('assets/images/heartbeat.png',color: heartColor,),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[Text(nilai, style: TextStyle(fontWeight: FontWeight.bold),), Text(keterangan,style: MyDefaultTextStyle().subtitle2,)],
          )
        ],
      ),
    );
  }
}
