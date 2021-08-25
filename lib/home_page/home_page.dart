import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tensys/style/color_style.dart';
import 'package:tensys/style/text_style.dart';

import 'home_body.dart';
import 'home_history.dart';
import 'home_profile.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  var riwayatList = [];
  List<FlSpot> detakList = [];
  List<FlSpot> sistolikList = [];
  List<FlSpot> diastolikList = [];
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    //instance.reference().child("users").child("12345").once();
    CollectionReference myDBReference =
        FirebaseFirestore.instance.collection('users');
    String screenSize;
    return FutureBuilder<DocumentSnapshot>(
      future: myDBReference.doc("TvSl0HuLK3Zhc6CI0vWR").get(),
      builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasData) {
          // print("Data Snapshot : "+ snapshot.toString() );
          Map dataKu = snapshot.data!.data() as Map;
          var mapName = dataKu["nama"];
          var mapNIK = dataKu["nik"];
          var mapEmail = dataKu["email"];
          var mapLahir = dataKu["ttl"];
          var mapKelamin = dataKu["gender"];
          var mapAlamat = dataKu["alamat"];
          var mapTelp = dataKu["noHandphone"];
          var mapPekerjaan = dataKu["pekerjaan"];
          var dataDenyut = 85;
          var dataSistolik = 121;
          var dataDiastolik = 81;
          // dataKu["riwayat"].forEach((key, value) {
          //   riwayatList.add(value);
          // })
          detakList.clear();
          sistolikList.clear();
          diastolikList.clear();
          riwayatList.clear();

          dataKu["riwayat"].forEach((key, value) {
            riwayatList.add(value);
            var timestampKu = value["timestamp"].toString().split("-");
            print(timestampKu);
            detakList.add(FlSpot(double.parse(timestampKu[0].toString()),
                double.parse(value["detakjantung"].toString())));
            sistolikList.add(FlSpot(double.parse(timestampKu[0].toString()),
                double.parse(value["sistolik"].toString())));
            diastolikList.add(FlSpot(double.parse(timestampKu[0].toString()),
                double.parse(value["diastolik"].toString())));
          });
          // print(diastolikList);
          print(detakList);
          // print(diastolikList);
          return SafeArea(
            child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              if (constraints.maxWidth < 715) {
                screenSize = "small";
              } else if (constraints.maxWidth >= 715 &&
                  constraints.maxWidth <= 1075) {
                screenSize = "mid";
              } else {
                screenSize = "large";
              }
              return Scaffold(
                key: _scaffoldKey,
                backgroundColor: HexColor("#f4f9fd"),
                endDrawer: screenSize == "small"
                    ? Container(
                        width: 75,
                        child: Drawer(
                            elevation: 5,
                            child: Column(children: [
                              _endDrawerIcon(
                                  context,
                                  () => Navigator.pop(context),
                                  Icons.arrow_back,
                                  "BACK"),
                              _endDrawerIcon(context, () {
                                setState(() {
                                  _selectedIndex = 0;
                                });
                              }, Icons.home, "HOME"),
                              _endDrawerIcon(context, () {
                                setState(() {
                                  _selectedIndex = 1;
                                });
                              }, Icons.bar_chart_sharp, "GRAFIK"),
                              _endDrawerIcon(context, () {
                                setState(() {
                                  _selectedIndex = 2;
                                });
                              }, Icons.person, "PROFIL"),
                            ])),
                      )
                    : null,
                appBar: PreferredSize(
                  preferredSize: Size.fromHeight(50.0),
                  child: AppBar(
                    // shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.only(
                    //         bottomLeft: Radius.circular(20),
                    //         bottomRight: Radius.circular(20))),
                    backgroundColor: HexColor("#f4f9fd"),
                    actions: [
                      screenSize == "small"
                          ? GestureDetector(
                              onTap: () =>
                                  _scaffoldKey.currentState!.openEndDrawer(),
                              child: Container(
                                height: 20,
                                width: 50,
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: Icon(
                                  Icons.menu,
                                  color: Colors.black,
                                ),
                              ),
                            )
                          : Row(
                              children: [
                                buildNavBarItem(Icons.home, 0, true),
                                buildNavBarItem(Icons.add_chart, 1, true),
                                buildNavBarItem(Icons.person, 2, true),
                              ],
                            )
                    ],
                    leadingWidth: 5,
                    title: Container(
                      // width: 500,
                      alignment: Alignment.centerLeft,
                      child:
                          // Text("TENSYS",
                          //     style: MyDefaultTextStyle().webAppBar)
                          Image.asset(
                        "assets/images/logo_tensys.png",
                        width: 100,
                      ),
                    ),
                  ),
                ),
                body: _selectedIndex == 0
                    ? HomeBody(
                        dataDenyut: dataDenyut,
                        dataDiastolik: dataDiastolik,
                        dataSistolik: dataSistolik,
                        isWeb: screenSize,
                        userName: mapName,
                      )
                    : _selectedIndex == 1
                        ? HomeHistory(
                            dataDetak: detakList,
                            dataDiastolik: diastolikList,
                            dataSistolik: sistolikList,
                            isWeb: screenSize,
                          )
                        : HomeProfile(
                            isWeb: screenSize,
                            userName: mapName,
                            profileNIK: mapNIK,
                            profileAlamat: mapAlamat,
                            profileEmail: mapEmail,
                            profileKelamin: mapKelamin,
                            profileLahir: mapLahir,
                            profilePekerjaan: mapPekerjaan,
                            profileTelp: mapTelp,
                          ),
              );

              // if (constraints.maxWidth <= 1039) {

              // } else {
              //   return Scaffold(
              //     backgroundColor: HexColor("#f4f9fd"),
              //     appBar: AppBar(
              //       leading: SizedBox(),
              //       // shape: RoundedRectangleBorder(
              //       //     borderRadius: BorderRadius.only(
              //       //         bottomLeft: Radius.circular(20),
              //       //         bottomRight: Radius.circular(20))),
              //       backgroundColor: HexColor("#f4f9fd"),
              //       actions: [
              //         buildNavBarItem(Icons.home, 0, true),
              //         buildNavBarItem(Icons.add_chart, 1, true),
              //         buildNavBarItem(Icons.person, 2, true),
              //       ],
              //       title: Container(
              //           width: 500,
              //           alignment: Alignment.centerLeft,
              //           child:
              //           // Text("TENSYS",
              //           //     style: MyDefaultTextStyle().webAppBar)
              //           Image.asset(
              //             "assets/images/logo_tensys.png",
              //             width: 150,
              //           ),
              //               ),
              //     ),
              //     body: _selectedIndex == 0
              //         ? HomeBody(
              //             dataDenyut: dataDenyut,
              //             dataDiastolik: dataDiastolik,
              //             dataSistolik: dataSistolik,
              //             isWeb: true,
              //             userName: mapName,
              //           )
              //         : _selectedIndex == 1
              //             ? HomeHistory(
              //                 dataDetak: detakList,
              //                 dataDiastolik: diastolikList,
              //                 dataSistolik: sistolikList,
              //                 isWeb: true,
              //               )
              //             : HomeProfile(
              //               userName: mapName,
              //                 profileNIK: mapNIK,
              //                 profileAlamat: mapAlamat,
              //                 profileEmail: mapEmail,
              //                 profileKelamin: mapKelamin,
              //                 profileLahir: mapLahir,
              //                 profilePekerjaan: mapPekerjaan,
              //                 profileTelp: mapTelp,
              //               ),
              //   );
              // }
            }),
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  Container _endDrawerIcon(BuildContext context, Function() navigation,
      IconData icon, String keterangan) {
    return Container(
      child: Column(
        children: [
          IconButton(onPressed: navigation, icon: Icon(icon)),
          Text(keterangan, style: MyDefaultTextStyle().button)
        ],
      ),
    );
  }

  Widget buildNavBarItem(IconData icon, int index, bool isWeb) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        height: 50,
        width: 100,
        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
        decoration: index == _selectedIndex
            ? BoxDecoration(
                border: Border(
                    bottom:
                        BorderSide(width: 4, color: MyColorStyle().headColor)),
                gradient: LinearGradient(colors: [
                  MyColorStyle().headColor.withOpacity(0.3),
                  MyColorStyle().headColor.withOpacity(0.015),
                ], begin: Alignment.bottomCenter, end: Alignment.topCenter))
            : BoxDecoration(),
        //color: index == _selectedIndex ? Colors.blue : Colors.white,
        child: isWeb
            ? Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Icon(
                      icon,
                      color: index == _selectedIndex
                          ? MyColorStyle().headColor
                          : Colors.black,
                    ),
                  ),
                  Expanded(
                      child: Text(
                    index == 0
                        ? "Home"
                        : index == 1
                            ? "Riwayat"
                            : "Profile",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: index == _selectedIndex
                          ? MyColorStyle().headColor
                          : Colors.black,
                    ),
                  ))
                ],
              )
            : Icon(
                icon,
                color: index == _selectedIndex
                    ? MyColorStyle().headColor
                    : Colors.black,
              ),
      ),
    );
  }
}
