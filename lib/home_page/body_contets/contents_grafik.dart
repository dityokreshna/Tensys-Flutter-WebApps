import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:tensys/style/color_style.dart';
import 'package:tensys/style/text_style.dart';

class ContentGrafik extends StatelessWidget {
  final int dataDenyut;
  final int dataSistolik;
  final int dataDiastolik;
  final String isWeb;
  ContentGrafik(
      {required this.isWeb,
      required this.dataDenyut,
      required this.dataSistolik,
      required this.dataDiastolik});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      // width: isWeb == "small" ? 1100 : 350,
      // decoration: BoxDecoration(
      //     color: Colors.white,
      //     boxShadow: [
      //       BoxShadow(
      //         color: Colors.black38,
      //         blurRadius: 2,
      //         offset: Offset(0, 0), // Shadow position
      //       ),
      //     ],
      //     borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Column(children: <Widget>[
        GrafikHeading(
            isWeb: this.isWeb, keterangan: "Kategori Tekanan Darah Anda"),
        Center(
          child: Container(
              width: 250,
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
              margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
              padding: EdgeInsets.all(10),
              child: Text(
                dataSistolik < 120 && dataDiastolik < 80
                    ? "Normal"
                    : dataSistolik >= 120 && dataSistolik <= 139 ||
                            dataDiastolik >= 80 && dataDiastolik <= 89
                        ? "Pra-Hipertensi"
                        : dataSistolik >= 140 && dataSistolik <= 159 ||
                                dataDiastolik >= 90 && dataDiastolik <= 99
                            ? "Hipertensi Tingkat 1"
                            : dataSistolik >= 160 || dataDiastolik >= 100
                                ? "Hipertensi Tingkat 2"
                                : dataSistolik > 140 && dataDiastolik < 90
                                    ? "Hipertensi Terisolasi"
                                    : "Belum Terdefinisi",
                style: MyDefaultTextStyle().headline5,
              )),
        ),
        GrafikHeading(isWeb: this.isWeb, keterangan: "Hasil Pengukuran"),
        GrafikData(
          isWeb: this.isWeb,
          dataDenyut: dataDenyut,
          dataDiastolik: dataDiastolik,
          dataSistolik: dataSistolik,
        ),
      ]),
    );
  }
}

class GrafikHeading extends StatelessWidget {
  final String isWeb;
  final String keterangan;
  GrafikHeading({required this.isWeb, required this.keterangan});
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
        alignment: Alignment.center,
        // decoration: BoxDecoration(color: Colors.yellow),
        child: Text(
          keterangan,
          style: MyDefaultTextStyle().headline6,
        ));
  }
}

class GrafikData extends StatelessWidget {
  final int dataDenyut;
  final int dataSistolik;
  final int dataDiastolik;
  final String isWeb;
  GrafikData(
      {required this.isWeb,
      required this.dataDenyut,
      required this.dataSistolik,
      required this.dataDiastolik});
  @override
  Widget build(BuildContext context) {
    int maxSis = 160;
    int maxDias = 100;
    double? myPercentSis = double.tryParse((dataSistolik / maxSis).toString());
    double? myPercentDias =
        double.tryParse((dataDiastolik / maxDias).toString());
    print("Diastolik :" + myPercentDias.toString());
    print("Sistolik :" + myPercentSis.toString());

    return Container(
        // height: isWeb ? 300 : 350,
        // width: 325,
        decoration: BoxDecoration(color: Colors.transparent),
        child: isWeb == "small"
            ? Column(
                children: <Widget>[
                  DataCard(
                      myPercent: myPercentSis,
                      dataNya: dataDenyut,
                      detailTextHead: "Denyut Nadi",
                      detailText: "Denyut Nadi Normal",
                      cardColor: MyColorStyle().heartBeat,
                      satuan: "BPM"),
                  DataCard(
                      myPercent: myPercentSis,
                      dataNya: dataSistolik,
                      detailTextHead: "Sistolik",
                      detailText: "Tekanan Darah Sistolik Normal",
                      cardColor: MyColorStyle().sistolik,
                      satuan: "mmHg"),
                  DataCard(
                      myPercent: myPercentDias,
                      dataNya: dataDiastolik,
                      detailTextHead: "Diastolik",
                      detailText: "Tekanan Darah Diastolik Normal",
                      cardColor: MyColorStyle().diastolik,
                      satuan: "mmHg")
                ],
              )
            : isWeb == "mid"
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            DataCard(
                                myPercent: myPercentSis,
                                dataNya: dataDenyut,
                                detailTextHead: "Denyut Nadi",
                                detailText: "Denyut Nadi Normal",
                                cardColor: MyColorStyle().heartBeat,
                                satuan: "BPM"),
                            DataCard(
                                myPercent: myPercentSis,
                                dataNya: dataSistolik,
                                detailTextHead: "Sistolik",
                                detailText: "Tekanan Darah Sistolik Normal",
                                cardColor: MyColorStyle().sistolik,
                                satuan: "mmHg"),
                          ],
                        ),
                      ),
                      DataCard(
                          myPercent: myPercentDias,
                          dataNya: dataDiastolik,
                          detailTextHead: "Diastolik",
                          detailText: "Tekanan Darah Diastolik Normal",
                          cardColor: MyColorStyle().diastolik,
                          satuan: "mmHg")
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      DataCard(
                          myPercent: myPercentSis,
                          dataNya: dataDenyut,
                          detailTextHead: "Denyut Nadi",
                          detailText: "Denyut Nadi Normal",
                          cardColor: MyColorStyle().heartBeat,
                          satuan: "BPM"),
                      DataCard(
                          myPercent: myPercentSis,
                          dataNya: dataSistolik,
                          detailTextHead: "Sistolik",
                          detailText: "Tekanan Darah Sistolik Normal",
                          cardColor: MyColorStyle().sistolik,
                          satuan: "mmHg"),
                      DataCard(
                          myPercent: myPercentDias,
                          dataNya: dataDiastolik,
                          detailTextHead: "Diastolik",
                          detailText: "Tekanan Darah Diastolik Normal",
                          cardColor: MyColorStyle().diastolik,
                          satuan: "mmHg")
                    ],
                  ));
  }
}

class DataCard extends StatelessWidget {
  final String detailTextHead;
  final String detailText;
  final String satuan;
  final Color cardColor;
  final int dataNya;
  final double? myPercent;
  DataCard(
      {required this.detailTextHead,
      required this.detailText,
      required this.cardColor,
      required this.dataNya,
      required this.myPercent,
      required this.satuan});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 315,
      margin: EdgeInsets.fromLTRB(5, 5, 0, 5),
      // height: 120,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black38,
              blurRadius: 2,
              offset: Offset(0, 0), // Shadow position
            ),
          ],
          border: Border.all(color: cardColor),
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(5),
            height: 90,
            child: CircularPercentIndicator(
              startAngle: 180,
              radius: 90.0,
              animation: false,
              animationDuration: 1200,
              lineWidth: 9.0,
              percent: myPercent!,
              center: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    dataNya.toString(),
                    style: MyDefaultTextStyle().headline5,
                  ),
                  Text(
                    satuan,
                    style: MyDefaultTextStyle().subtitle2,
                  ),
                ],
              ),
              circularStrokeCap: CircularStrokeCap.round,
              backgroundColor: Colors.transparent,
              progressColor: cardColor,
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
              height: 105,
              // decoration: BoxDecoration(color: Colors.pink),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(this.detailTextHead,
                      style: MyDefaultTextStyle().headline6),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          this.detailText,
                          style: MyDefaultTextStyle().subtitle2,
                        ),
                        Text(
                          "Tidak ada gejala hipertensi",
                          style: MyDefaultTextStyle().subtitle2,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
