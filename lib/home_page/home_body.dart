import 'package:flutter/material.dart';
import 'package:tensys/home_page/body_contets/contents_grafik.dart';
import 'body_contets/contents_heading.dart';

class HomeBody extends StatelessWidget {
  final String isWeb;
  final String userName;

  final int dataDenyut;
  final int dataSistolik;
  final int dataDiastolik;

  HomeBody(
      {required this.userName,
      required this.isWeb,
      required this.dataDenyut,
      required this.dataSistolik,
      required this.dataDiastolik});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Container(
                //   margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                //   child: Text("APP HIPERTENSI", textAlign: TextAlign.center, style: MyDefaultTextStyle().texthead,)),
                ContentHeading(
                  isWeb: isWeb,
                  userName: userName,
                ),
                ContentGrafik(
                  isWeb: isWeb,
                  dataDenyut: dataDenyut,
                  dataDiastolik: dataDiastolik,
                  dataSistolik: dataSistolik,
                ),
                // Container(
                //   padding:EdgeInsets.all(4),
                //   decoration: BoxDecoration(
                //       // border: Border.all(color: HexColor("#5ad6c8"), width: 1),
                //       color: Colors.white,
                //       boxShadow: [
                //         BoxShadow(
                //           color: Colors.black,
                //           blurRadius: 4,
                //           offset: Offset(0, 0), // Shadow position
                //         ),
                //       ],
                //       // border: Border.all(),
                //       borderRadius: BorderRadius.all(Radius.circular(10))),
                //       child: Column(
                //         children: [
                //           Text("Kategori Tekanan Darah saat ini:"),
                //           Text("Hipertensi",style: MyDefaultTextStyle().headline6,),
                //         ],
                //       ),
                // )
              ],
            )),
      ),
    );
  }
}
