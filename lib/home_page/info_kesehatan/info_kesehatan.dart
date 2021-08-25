import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tensys/style/color_style.dart';
import 'package:tensys/style/text_style.dart';

class InfoTextStyle {
  TextStyle textHead = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 18,
  );
  TextStyle textHeadBottom = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 10,
  );
  TextStyle textHeadv2 = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 18,
  );
  TextStyle textHeadv3 = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );
  TextStyle textPoint = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );
}

class InfoKesehatan extends StatefulWidget {
  @override
  _InfoKesehatanState createState() => _InfoKesehatanState();
}

class _InfoKesehatanState extends State<InfoKesehatan> {
  bool menu2 = false;
  bool menu1 = false;
  bool menu3 = false;
  bool menu4 = false;
  bool menu5 = false;
  bool menu6 = false;
  bool menu7 = false;
  bool menu8 = false;
  bool menu9 = false;
  bool menu10 = false;
  bool menu11 = false;
  bool menu12 = false;
  bool menu13 = false;
  bool menu14 = false;
  bool menu15 = false;

  @override
  Widget build(BuildContext context) {
    String screenSize;
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
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50.0),
            child: AppBar(
              // shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.only(
              //         bottomLeft: Radius.circular(20),
              //         bottomRight: Radius.circular(20))),
              backgroundColor: HexColor("#f4f9fd"),
              actions: [
                Container(
                  margin:EdgeInsets.only(right:8),
                    alignment: Alignment.centerRight,
                    height: 100,
                    child: Text(
                      "Info Kesehatan Seputar Hipertensi",
                      style: MyDefaultTextStyle().subtitleHeading,
                    ))
              ],
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
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
          body: Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: screenSize == "small"
                  ? ListView(
                      children: <Widget>[
                        _listHeading(screenSize),
                        _listMethod(),
                      ],
                    )
                  : screenSize == "mid"
                      ? ListView(
                          children: <Widget>[
                            _listHeading(screenSize),
                            _listMethod(),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                alignment: Alignment.center,
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: _listHeading(screenSize)),
                            SingleChildScrollView(
                              child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: _listMethod()),
                            ),
                          ],
                        )),
        );
      }),
    );
  }

  Column _listHeading(String screenSize) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            width: 150,
            height: 200,
            child: Stack(
              children: [
                Positioned(
                    bottom: 0,
                    // left: 0,
                    // top: 30,
                    child: Container(
                      height: 100,
                      width: 150,
                      decoration: BoxDecoration(
                          color: MyColorStyle().headColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black38,
                              blurRadius: 2,
                              offset: Offset(0, 0), // Shadow position
                            ),
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                    )),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  top: 0,
                  child: Image(
                    image: AssetImage('assets/images/doctor.png'),
                  ),
                ),
              ],
            )),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            "Klasifikasi Hipertensi",
            style: InfoTextStyle().textHead,
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Text(
            "Untuk menegakkan diagnosis hipertensi dilakukan pengukuran darah minimal 2 kali dengan jarak 1 minggu",
            style: InfoTextStyle().textHeadBottom,
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Text(
            "2017 Guideline for the Prevention, Detection, Evaluation, and Management of High Blood Pressure in Adults",
            style: InfoTextStyle().textHeadBottom,
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Text(
            "A report of the American College of Cardiology/American Heart Association Task Force on Clinical Practice Guidelines",
            style: InfoTextStyle().textHeadBottom,
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          margin: const EdgeInsets.all(12.0),
          height: 90,
          // screenSize == "small"
          //     ? 90
          //     : screenSize == "mid"
          //         ? 100
          //         : 120,
          // width: 300,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/tabel.png'),
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
      ],
    );
  }

  _listMethod() {
    return Column(
      children: [
        //header 1
        InkWell(
          onTap: () {
            setState(() {
              if (menu1 == false) {
                menu1 = true;
              } else {
                menu1 = false;
              }
              print(menu1);
            });
          },
          child: Container(
            decoration: BoxDecoration(
                color: menu1 ? MyColorStyle().sistolik : Colors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(15))),
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(9.0),
            child: Text(
              "Apa itu tekanan darah ?",
              style: InfoTextStyle().textHeadv2,
              textAlign: TextAlign.left,
            ),
          ),
        ),
        menu1 == true
            ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                _myText(
                    "Tekanan darah adalah ukuran yang dapat menentukan seberapa kuat jantung untuk memompa darah ke seluruh tubuh Anda."),
                _myText(
                    "Tekanan darah sistolik (angka atas pada monitor tekanan darah) adalah tekanan tertinggi dalam pembuluh darah ketika jantung berkontraksi/berdetak."),
                _myText(
                    "Tekanan darah diastolik (angka yang lebih rendah pada monitor tekanan darah) adalah tekanan terendah dalam pembuluh darah di antara detak jantung ketika otot jantung rileks."),
              ])
            : SizedBox(),

        // header2
        InkWell(
          onTap: () {
            setState(() {
              if (menu2 == false) {
                menu2 = true;
              } else {
                menu2 = false;
              }
              print(menu2);
            });
          },
          child: Container(
            decoration: BoxDecoration(
                color: menu2 ? MyColorStyle().sistolik : Colors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(15))),
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(9.0),
            child: Text(
              "Apa fungsi nilai denyut nadi ?",
              style: InfoTextStyle().textHeadv2,
              textAlign: TextAlign.left,
            ),
          ),
        ),
        menu2 == true
            ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                _myText(
                    "Penting untuk mengidentifikasi apakah detak jantung Anda berada dalam kisaran normal. Jika terdapat penyakit atau cedera yang melemahkan jantung, orang lain tidak akan menerima cukup darah agar berfungsi normal. Perlu diketahui, detak jantung semakin lambat saat seseorang melewati masa kanak-kanak menuju masa remaja."),
                _myText(
                    "Detak jantung istirahat normal untuk orang dewasa, termasuk orang dewasa yang lebih tua, adalah antara 50 dan 100 denyut per menit (bpm). Sementara itu, atlet yang sangat terlatih mungkin memiliki detak jantung istirahat di bawah 60 bpm, terkadang mencapai 40 bpm."),
                _myText(
                    "Denyut jantung yang baik berbeda pada setiap orang, dan tergantung pada usia dan jenis pekerjaan fisik yang dilakukan. Berikut ini perkiraan detak jantung rentang usia (detak per menit atau bpm) :"),
                _rowText("Baru lahir : 100 - 160 bpm"),
                _rowText("0-5 bulan : 90 - 150 bpm"),
                _rowText("6-12 bulan : 80 - 140 bpm"),
                _rowText("1-3 tahun : 80 - 130 bpm"),
                _rowText("3-4 tahun : 80 - 120 bpm"),
                _rowText("6-10 tahun : 70 - 110 bpm"),
                _rowText("11-14 tahun : 60 - 105 bpm"),
                _rowText("15 tahun ke atas : 60 - 100 bpm"),
                _myText(
                    "Perlu diketahui, detak jantung yang lebih rendah dari 60 per menit tidak selalu berarti abnormal. Jika Anda seorang atlet atau seseorang yang melakukan aktivitas fisik sedang hingga berat, detak jantung mungkin antara 40 dan 60 per menit.")
              ])
            : SizedBox(),

        //header 3
        InkWell(
          onTap: () {
            setState(() {
              if (menu3 == false) {
                menu3 = true;
              } else {
                menu3 = false;
              }
              print(menu3);
            });
          },
          child: Container(
            decoration: BoxDecoration(
                color: menu3 ? MyColorStyle().sistolik : Colors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(15))),
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(9.0),
            child: Text(
              "Apa itu hipertensi (tekanan darah tinggi) ?",
              style: InfoTextStyle().textHeadv2,
              textAlign: TextAlign.left,
            ),
          ),
        ),
        menu3 == true
            ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                _myText(
                    "Hipertensi terjadi ketika tekanan darah sistolik sama dengan / lebih besar dari 135 mmHg & tekanan darah diastolik sama dengan / lebih besar dari 80 mmHg. Jika dibiarkan tidak terkontrol, hipertensi dapat menyebabkan serangan jantung, stroke, demensia, gagal ginjal, kehilangan penglihatan di antara konsekuensi serius."),
                _myText(
                    "Hipertensi merupakan penyakit tidak menular yang menjadi salah satu penyebab utama kematian prematur di dunia. Organisasi kesehatan dunia (World Health Organization/WHO) mengestimasikan saat ini prevalensi hipertensi secara global sebesar 22% dari total penduduk dunia. Dari sejumlah penderita tersebut, hanya kurang dari seperlima yang melakukan upaya pengendalian terhadap tekanan darah yang dimiliki."),
                _myText(
                    "Wilayah Afrika memiliki prevalensi hipertensi tertinggi sebesar 27%. Asia Tenggara berada di posisi ke-3 tertinggi dengan prevalensi sebesar 25% terhadap total penduduk. WHO juga memperkirakan 1 di antara 5 orang perempuan di seluruh dunia memiliki hipertensi. Jumlah ini lebih besar diantara kelompok laki-laki, yaitu 1 di antara 4."),
                _myText(
                    "Tidak semua penderita hipertensi menyadari penyakit yang dideritanya. Hal ini yang membuat hipertensi kerap disebut sebagai “silent killer”atau “pembunuh senyap”."),
              ])
            : SizedBox(),

        //header 4
        InkWell(
          onTap: () {
            setState(() {
              if (menu4 == false) {
                menu4 = true;
              } else {
                menu4 = false;
              }
              print(menu4);
            });
          },
          child: Container(
            decoration: BoxDecoration(
                color: menu4 ? MyColorStyle().sistolik : Colors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(15))),
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(9.0),
            child: Text(
              "Apa saja penyebab hipertensi ?",
              style: InfoTextStyle().textHeadv2,
              textAlign: TextAlign.left,
            ),
          ),
        ),
        menu4 == true
            ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                _myText(
                    "Berdasarkan penyebab, hipertensi terbagi menjadi dua, yaitu : "),
                _myText(
                    "1.	Hipertensi esensial atau primer yang tidak diketahui penyebabnya."),
                _myText(
                    "2.	Hipertensi sekunder yang penyebabnya dapat ditentukan melalui tanda-tanda di antaranya kelainan pembuluh darah ginjal, gangguan kelenjar tiroid (hipertiroid), dan penyakit kelenjar adrenal (hiperaldosteronisme)."),
              ])
            : SizedBox(),

        //header 5
        InkWell(
          onTap: () {
            setState(() {
              if (menu5 == false) {
                menu5 = true;
              } else {
                menu5 = false;
              }
              print(menu5);
            });
          },
          child: Container(
            decoration: BoxDecoration(
                color: menu5 ? MyColorStyle().sistolik : Colors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(15))),
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(9.0),
            child: Text(
              "Apa saja faktor penyebab terjadinya hipertensi ?",
              style: InfoTextStyle().textHeadv2,
              textAlign: TextAlign.left,
            ),
          ),
        ),
        menu5 == true
            ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                _rowText("Obesitas"),
                _myText(
                    "Obesitas dapat menyebabkan terjadinya hipertensi melalui berbagai mekanisme, baik secara langsung mau- pun secara tidak langsung. Secara langsung obesitas me- nyebabkan terjadinya peningkatan cardiac output karena semakin besar massa tubuh seseorang maka semakin banyak pula jumlah darah yang beredar sehingga curah jantung akan ikut meningkat. Sedangkan secara tidak langsung melalui perangsangan aktivitas sistem saraf simpatis dan Renin Angiotensin Aldosteron System (RAAS) oleh mediator-mediator seperti hormon, sitokin, dan adipokin. Salah satunya adalah hormon aldosteron yang terkait erat dengan retensi air dan natrium sehingga volume darah meningkat."),
                _rowText("Kebiasaan Merokok"),
                _myText(
                    "Nikotin dan karbon monoksida memiliki racun berpengaruh pada jantung dan pembuluh darah. Nikotin bisa meningkatkan pelepasan katekolamin sehingga bisa meningkatkan tekanan darah sistolik dan detak jantung. Karbon monoksida dapat mengikat dengan membentuk hemoglobin karboksihemoglobin. Karboksihemoglobin ini menyebabkan hipoksia jaringan sehingga dapat merusak jantung dan pembuluh darah. Selain pengaruh rokok sehingga dapat menyebabkan hipertensi dipengaruhi oleh kandungan atau zat yang terkandung di dalam rokok antara lain nikotin dan karbon monoksida. Merokok menyebabkan aktivasi simpatetik, stres oksidatif, dan efek vasopresor akut yang meningkatkan marker inflamasi yang berhubungan dengan hipertensi. Mekanisme rokok sehingga menimbulkan hipertensi terutama dilihat dari konsumsi rokok dalam waktu yang lama."),
                _rowText("Stress"),
                _myText(
                    "Kondisi stres yang membuat tubuh menghasilkan hormon adrenalin lebih banyak, membuat jantung berkerja lebih kuat dan cepat. Apabila terjadi dalam jangka wak- tu yang lama maka akan timbul rangkaian reaksi dari organ tubuh lain. Perubahan fungsional tekanan darah yang disebabkan oleh kondisi stres dapat menyebabkan hipertropi kardiovaskuler bila berulang secara inter- miten. Begitupula stres yang dialami penderita hipertensi, maka akan mempengaruhi peningkatan tekanan darahnya yang cenderung menetap atau bahkan dapat bertambah tinggi sehingga menyebabkan kondisi hipertensinya menjadi lebih berat."),
                _rowText("Faktor Keturunan"),
                _myText(
                    "Riwayat keluarga dan faktor genetik remaja yang berasal dari keluarga dengan riwayat hipertensi, mempunyai risiko yang lebih besar untuk menderita hipertensi dibanding dengan keluarga tanpa riwayat hipertensi. Jika kedua orangtua hipertensi, maka angka kejadian hipertensi pada keturunannya meningkat 4 sampai 15 kali dibanding bila kedua orangtua adalah normotensi. Bila kedua orangtua menderita hipertensi esensial, maka 44,8% anaknya akan menderita hipertensi. Jika hanya salah satu orangtua hipertensi maka 12,8% keturunannya akan mengalami hipertensi. Ekspresi dari hipertensi pada seseorang sepertinya merupakan hasil dari perubahan-perubahan pada genetik. Telah terbukti bahwa bukan hanya tekanan darah, tapi juga mekanisme pengaturan sistem reninangiotensin-aldosteron, sistem saraf simpatis, semuanya dipengaruhi secara genetik. Teknik biomolekular modern telah memungkinkan pemeriksaan gen yang bertanggungjawab terhadap terjadinya hipertensi pada seseorang.")
              ])
            : SizedBox(),

        //header 6
        InkWell(
          onTap: () {
            setState(() {
              if (menu6 == false) {
                menu6 = true;
              } else {
                menu6 = false;
              }
              print(menu6);
            });
          },
          child: Container(
            decoration: BoxDecoration(
                color: menu6 ? MyColorStyle().sistolik : Colors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(15))),
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(9.0),
            child: Text(
              "Apa saja gejala hipertensi ?",
              style: InfoTextStyle().textHeadv2,
              textAlign: TextAlign.left,
            ),
          ),
        ),
        menu6 == true
            ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                _myText(
                    "Tidak semua penderita hipertensi mengenalu atau merasakan keluhan maupun gejala, sehingga hipertensi sering dijuluki sebagai pembunuh diam-diam (silent killer). Keluhan-keluhan pada penderita hipertensi antara lain:"),
                _rowText("Sakit Kepala"),
                _rowText("Gelisah"),
                _rowText("Jantung Berdebar-debar"),
                _rowText("Pusing"),
                _rowText("Pengelihatan Kabur"),
                _rowText("Rasa Sakit di Dada"),
                _rowText("Mudah Lelah"),
                _myText("Gejala komplikasi pada hipertensi:"),
                _rowText("Gangguan Pengelihatan"),
                _rowText("Gangguan Saraf"),
                _rowText("Gangguan Jantung"),
                _rowText("Gangguan Ginjal"),
                _rowText(
                    "Gangguan serebral (otak) yang mengakibatkan kejang, perdarahan pembuluh darah otak yang mengakibatkan kelumpuhan, gangguan kesadaran hingga koma."),
              ])
            : SizedBox(),

        //header 7
        InkWell(
          onTap: () {
            setState(() {
              if (menu7 == false) {
                menu7 = true;
              } else {
                menu7 = false;
              }
              print(menu7);
            });
          },
          child: Container(
            decoration: BoxDecoration(
                color: menu7 ? MyColorStyle().sistolik : Colors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(15))),
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(9.0),
            child: Text(
              "Apa rekomendasi tindak lanjut hipertensi ?",
              style: InfoTextStyle().textHeadv2,
              textAlign: TextAlign.left,
            ),
          ),
        ),
        menu7 == true
            ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                _myText(
                    "Pengobatan hipertensi merupakan pengobatan yang lama dan terus menerus sepanjang hidup. Rekomendasi tindak lanjut berdasarkan pengukuran tekanan darah awal pada pasien hipertensi dewasa tanpa kerusakan organ target."),
                _rowText("Normal : pemeriksaan ulang 2 tahun kemudian"),
                _rowText(
                    "Prehipertensi : pemeriksaan ulang 1 tahun kemudian, modifikasi gaya hidup."),
                _rowText(
                    "Derajat 1 hipertensi : pastikan dalam tempo 2 bulan, modifikasi pola hidup, evaluasi atau rujuk dalam tempo 1 bulan."),
                _rowText(
                    "Derajat 2 hipertensi	: bila tekanan > 180/110 mmHg – evaluasi dan terapi segera atau rujuk dalam tempo 1 minggu tergantung situasi dan komplikasi.")
              ])
            : SizedBox(),

        //header 8
        InkWell(
          onTap: () {
            setState(() {
              if (menu8 == false) {
                menu8 = true;
              } else {
                menu8 = false;
              }
              print(menu2);
            });
          },
          child: Container(
            decoration: BoxDecoration(
                color: menu8 ? MyColorStyle().sistolik : Colors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(15))),
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(9.0),
            child: Text(
              "Bagaimana cara mengendalikan hipertensi ?",
              style: InfoTextStyle().textHeadv2,
              textAlign: TextAlign.left,
            ),
          ),
        ),
        menu8 == true
            ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                _myText("Kendalikan Hipertensi dengan PATUH"),
                _rowText(
                    "Periksa kesehatan secara rutin dan ikuti anjuran dokter."),
                _rowText("Tetap diet dengan gizi seimbang."),
                _rowText("Upayakan aktivitas fisik dengan aman."),
                _rowText(
                    "Hindari asap rokok, alkohol, dan zat karsinogenik lainnya."),
              ])
            : SizedBox(),

        //header 9
        InkWell(
          onTap: () {
            setState(() {
              if (menu9 == false) {
                menu9 = true;
              } else {
                menu9 = false;
              }
              print(menu2);
            });
          },
          child: Container(
            decoration: BoxDecoration(
                color: menu9 ? MyColorStyle().sistolik : Colors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(15))),
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(9.0),
            child: Text(
              "Bagaimana cara mencegah risiko hipertensi ?",
              style: InfoTextStyle().textHeadv2,
              textAlign: TextAlign.left,
            ),
          ),
        ),
        menu9 == true
            ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                _rowText("Raih dan pertahankan berat badan ideal."),
                _rowText(
                    "Lakukan olahraga rutin, seperti jalan cepat atau bersepeda 2–3 jam setiap minggu."),
                _rowText(
                    "Konsumsi makanan rendah lemak dan kaya serat, seperti buah dan sayuran."),
                _rowText(
                    "Batasi jumlah garam dalam makanan, tidak lebih dari 1 sendok teh per hari."),
                _rowText("Hindari konsumsi minuman beralkohol."),
                _rowText("Batasi konsumsi minuman berkafein."),
                _rowText("Hentikan kebiasaan merokok."),
                Container(
                  padding: const EdgeInsets.all(9.0),
                  child: Text(
                    "Catatan Khusus:",
                    style: InfoTextStyle().textHeadv3,
                  ),
                ),
                _rowText(
                    "Pencegahan lanjut untuk penderita yang memiliki resiko tinggi harus disertai dengan mengkonsumsi obat anti hipertensi."),
                _rowText(
                    "Konsumsi obat anti hipertensi tergantung pada nilai tekanan darah pasien dan seberapa besar risiko pasien terserang komplikasi, seperti stroke atau serangan jantung."),
                _myText("(Sumber : Kemenkes RI, 2020)")
              ])
            : SizedBox(),

        //header 10
        InkWell(
          onTap: () {
            setState(() {
              if (menu10 == false) {
                menu10 = true;
              } else {
                menu10 = false;
              }
              print(menu10);
            });
          },
          child: Container(
            decoration: BoxDecoration(
                color: menu10 ? MyColorStyle().sistolik : Colors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(15))),
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(9.0),
            child: Text(
              "Bagaimana metode pengobatan untuk menangani hipertensi ?",
              style: InfoTextStyle().textHeadv2,
              textAlign: TextAlign.left,
            ),
          ),
        ),
        menu10 == true
            ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Container(
                  padding: const EdgeInsets.all(9.0),
                  child: Text(
                    "A. Perubahan Gaya Hidup",
                    style: InfoTextStyle().textPoint,
                  ),
                ),
                _myText(
                    "Mengubah gaya hidup menjadi lebih sehat bisa menurunkan tekanan darah dalam beberapa minggu. Biasanya, dokter akan menyarankan perubahan gaya hidup tanpa perlu konsumsi obat jika risiko pasien terserang komplikasi rendah."),
                _myText(
                    "Gaya hidup sehat yang yang perlu dijalani, antara lain:"),
                _rowText("Mengonsumsi lebih banyak buah dan sayur-sayuran."),
                _rowText(
                    "Mengurangi konsumsi garam hingga kurang dari satu sendok teh per hari."),
                _rowText("Memperbanyak aktivitas fisik dan rutin berolahraga."),
                _rowText(
                    "Menurunkan berat badan berlebih dan menjaga berat badan ideal."),
                _rowText("Menghentikan kebiasaan merokok."),
                _rowText(
                    "Menghindari atau mengurangi konsumsi minuman beralkohol."),
                _rowText(
                    "Mengurangi konsumsi minuman berkafein, seperti kopi, teh, atau cola."),
                _rowText(
                    "Melakukan terapi relaksasi untuk mengelola stres, seperti yoga atau meditasi."),
                Container(
                  padding: const EdgeInsets.all(9.0),
                  child: Text(
                    "B. Penggunaan Obat-obatan",
                    style: InfoTextStyle().textPoint,
                  ),
                ),
                _myText(
                    "Pada beberapa kasus, penderita hipertensi harus mengonsumsi obat penurun tekanan darah untuk seumur hidup. Dokter dapat menurunkan dosis atau menghentikan pengobatan jika tekanan darah pasien sudah terkendali melalui perubahan gaya hidup. Dokter akan meresepkan obat antihipertensi pada pasien yang tekanan darahnya lebih dari 140/90 mmHg dan berisiko terserang komplikasi."),
                _myText(
                    "Beberapa jenis obat yang sering digunakan untuk menangani hipertensi adalah:"),
                _rowText("Diuretik, seperti hydrochlorothiazide."),
                _rowText(
                    "Antagonis kalsium, seperti amlodipine dan nifedipine."),
                _rowText("Penghambat Beta, seperti atenolol dan bisoprolol."),
                _rowText("ACE inhibitor, seperti captopril dan ramipril."),
                _rowText("Diuretik hemat kalium, seperti spironolactone."),
                _rowText(
                    "Angiotensin-2 receptor blocker (ARB), seperti losartan dan valsartan."),
                _rowText("Penghambat renin, seperti aliskiren."),
                _rowText("Vasodilator, seperti minoxidil."),
                Container(
                  padding: const EdgeInsets.all(9.0),
                  child: Text(
                    "Catatan Khusus:",
                    style: InfoTextStyle().textHeadv3,
                  ),
                ),
                _myText(
                    "Penting bagi pasien untuk mengonsumsi obat di atas dalam dosis yang sudah ditentukan dan memberitahu dokter jika ada efek samping yang muncul.")
              ])
            : SizedBox(),

        //header 11
        InkWell(
          onTap: () {
            setState(() {
              if (menu11 == false) {
                menu11 = true;
              } else {
                menu11 = false;
              }
              print(menu11);
            });
          },
          child: Container(
            decoration: BoxDecoration(
                color: menu11 ? MyColorStyle().sistolik : Colors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(15))),
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(9.0),
            child: Text(
              "Bagaimana Upaya Pengendalian Hipertensi ?",
              style: InfoTextStyle().textHeadv2,
              textAlign: TextAlign.left,
            ),
          ),
        ),
        menu11 == true
            ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                _myText(
                    "Pengendalian hipertensi bertujuan untuk mencegah dan menurunkan probabilitas kesakitan, komplikasi, dan kematian. Langkah ini dapat dikelompokkan menjadi pendekatan farmakologis dan non-farmakologis."),
                _myText(
                    "Pendekatan farmakologis merupakan upaya pengobatan untuk mengontrol tekanan darah penderita hipertensi yang dapat diawali dari pelayanan kesehatan tingkat pertama seperti puskesmas atau klinik. Terapi farmakologis dimulai dengan obat tunggal yang mempunyai masa kerja panjang sehingga dapat diberikan sekali sehari dan dosisnya dititrasi. Obat berikutnya dapat ditambahkan selama beberapa bulan pertama selama terapi dilakukan."),
                _myText(
                    "Jenis obat hipertensi terdiri dari diuretic, penyekat beta, golongan penghambat Angiotensin Converting Enzyme (ACE), dan Angiotensin Receptor Blocker (ARB), golongan Calcium Channel Blockers (CCB), dan golongan anti hipertensi lain. Beberapa hal yang perlu diperhatikan dalam pengobatan hipertensi antara lain :"),
                _rowText(
                    "Pengobatan esensial dilakukan untuk menurunkan tekanan darah dengan tujuan memperpanjang harapan hidup dan mengurangi komplikasi."),
                _rowText(
                    "Pengobatan sekunder lebih ditujukan untuk mengendalikan penyebab hipertensi."),
                _rowText(
                    "Pemilihan kombinasi obat anti-hipertensi didasarkan pada keparahan dan respon penderita terhadap obat yang diberikan."),
                _rowText(
                    "Pengobatan hipertensi dilakukan dalam waktu yang lama, bahkan mungkin sampai seumur hidup."),
                _rowText(
                    "Pasien yang berhasil mengontrol tekanan darah, maka pemberian obat hipertensi di puskesmas diberikan pada saat kunjugan, dengan catatan obat yang baru diberikan untuk pemakaian selama 30 hari bila tanpa keluhan baru."),
                _rowText(
                    "Penderita yang baru didiagnosis, disarankan melakukan kontrol ulang 4 kali dalam sebulan atau seminggu sekali, bila tekanan darah sistolik > 160 mmHg atau diastolik > 100 mmH sebaiknya diberikan terapi kombinasi setelah kunjungan kedua (dalam 2 minggu) tekanan darah tidak dapat dikontrol."),
                _rowText(
                    "Kasus hipertensi atau tekanan darah tidak dapat dikontrol setelah pemberian obat pertama, maka langsung diberikan terapi pengobatan kombinasi bila tidak dapat dirujuk ke fasyankes yang lebih tinggi."),
              ])
            : SizedBox(),

        //header 12
        InkWell(
          onTap: () {
            setState(() {
              if (menu12 == false) {
                menu12 = true;
              } else {
                menu12 = false;
              }
              print(menu12);
            });
          },
          child: Container(
            decoration: BoxDecoration(
                color: menu12 ? MyColorStyle().sistolik : Colors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(15))),
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(9.0),
            child: Text(
              "Kapan waktu optimal untuk mengukur tekanan darah ?",
              style: InfoTextStyle().textHeadv2,
              textAlign: TextAlign.left,
            ),
          ),
        ),
        menu12 == true
            ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                _myText(
                    "Sangat optimal untuk mengukur tekanan darah dalam 1 jam setelah Anda bangun di pagi hari & sebelum tidur di malam hari."),
                _myText(
                    "Jika Anda mengukur tekanan darah Anda di pagi hari, ukurlah dalam waktu 1 jam setelah Anda bangun; sebelum sarapan & setelah mengunjungi kamar kecil, istirahat selama 1-2 menit & kemudian lakukan pengukuran dalam posisi duduk. Jika Anda mengukur tekanan darah Anda di malam hari, setelah beristirahat selama 1-2 menit, ukurlah dalam posisi duduk sebelum Anda pergi tidur."),
                _myText(
                    "Disarankan untuk melakukan pengukuran pada periode waktu yang sama setiap hari. Apakah saya akan melihat perbedaan antara pembacaan saya di rumah dengan pembacaan di kantor dokter saya ?"),
                _myText(
                    "1.	Tekanan darah seseorang bervariasi sepanjang hari, jadi pada saat tertentu tekanan darah Anda dapat berubah."),
                _myText(
                    "2.	Dalam hal jumlah perubahan; ada penelitian yang dipublikasikan yang menunjukkan tekanan darah seseorang dapat berubah hingga 20 mm dalam sehari, berdasarkan tingkat aktivitas, asupan makanan / minuman, stres, dll."),
                _myText(
                    "3.	Anda mungkin memiliki kondisi yang dikenal sebagai “White Coat Hypertension.” Ini adalah kondisi di mana tekanan darah seseorang darah naik di atas tingkat biasanya ketika diukur di kantor dokter atau pengaturan klinis."),
                _myText(
                    '4.	Anda mungkin memiliki kondisi yang dikenal sebagai "Masked Hypertension." Ini adalah situasi di mana tekanan darah seseorang turun di bawah tingkat biasanya ketika mengukur di kantor dokter atau pengaturan klinis.'),
                _myText(
                    "Jadi jangan khawatir ketika Anda melihat perbedaan antara bacaan Anda di rumah dibandingkan dengan bacaan Anda di kantor dokter Anda. Diskusikan dengan dokter Anda untuk mendapatkan gambaran terbaik tentang kesehatan jantung Anda."),
              ])
            : SizedBox(),

        //header 13
        InkWell(
          onTap: () {
            setState(() {
              if (menu13 == false) {
                menu13 = true;
              } else {
                menu13 = false;
              }
              print(menu13);
            });
          },
          child: Container(
            decoration: BoxDecoration(
                color: menu13 ? MyColorStyle().sistolik : Colors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(15))),
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(9.0),
            child: Text(
              "Bagaimana saya mengukur tekanan darah saya dengan benar ?",
              style: InfoTextStyle().textHeadv2,
              textAlign: TextAlign.left,
            ),
          ),
        ),
        menu13 == true
            ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                _myText(
                    "1. Duduk dengan tenang selama sekitar 5 menit dengan kedua kaki rata di lantai."),
                _myText(
                    "2. Jangan merokok, mandi, minum minuman berkafein / alkohol atau berolahraga 30 menit sebelum pengukuran."),
                _myText("3. Ukur pada waktu yang sama setiap hari."),
                _myText(
                    "4. Ambil beberapa bacaan & catat hasilnya menggunakan buku harian atau aplikasi."),
              ])
            : SizedBox(),

        //header 14
        InkWell(
          onTap: () {
            setState(() {
              if (menu14 == false) {
                menu14 = true;
              } else {
                menu14 = false;
              }
              print(menu14);
            });
          },
          child: Container(
            decoration: BoxDecoration(
                color: menu14 ? MyColorStyle().sistolik : Colors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(15))),
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(9.0),
            child: Text(
              "Angka mana yang lebih penting? (Tekanan darah sistolik/diastolik)",
              style: InfoTextStyle().textHeadv2,
              textAlign: TextAlign.left,
            ),
          ),
        ),
        menu14 == true
            ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                _myText(
                    "Kedua bacaan itu penting. Tekanan darah sistolik mengukur tekanan darah Anda selama kontraksi jantung & yang lain mengukur tekanan darah antara kontraksi jantung. Biasanya, lebih banyak perhatian diberikan kepada tekanan darah sistolik, karena ini menunjukkan faktor risiko utama untuk penyakit kardiovaskular. Untuk situasi khusus Anda, Anda harus mendiskusikan hasil pengukuran dengan dokter Anda."),
              ])
            : SizedBox(),
        InkWell(
          onTap: () {
            setState(() {
              if (menu15 == false) {
                menu15 = true;
              } else {
                menu15 = false;
              }
              print(menu15);
            });
          },
          child: Container(
            decoration: BoxDecoration(
                color: menu15 ? MyColorStyle().sistolik : Colors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(15))),
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(9.0),
            child: Text(
              "Mengapa penting untuk memonitor tekanan darah di rumah ?",
              style: InfoTextStyle().textHeadv2,
              textAlign: TextAlign.left,
            ),
          ),
        ),
        menu15 == true
            ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                _myText(
                    "Pemantauan tekanan darah di rumah telah ditemukan berguna dalam membantu untuk memantau efek dari obat hipertensi, serta mendeteksi hipertensi tersamar & gejala yang sulit ditemukan sebaliknya. Untuk alasan ini & lainnya, organisasi medis di seluruh dunia sekarang menekankan pentingnya pemantauan tekanan darah di rumah."),
              ])
            : SizedBox(),
      ],
    );
  }

  // InkWell _pushHeader(String nama, bool menu, String namaMenu) {
  //   return InkWell(
  //     onTap: () {
  //       setState(() {
  //         // print(nama + " = " + namaMenu);
  //         if (namaMenu == 'false') {
  //           namaMenu = 'true';
  //           // print("trueeee");
  //         } else {
  //           namaMenu = 'false';
  //           // print("falseeee");
  //         }
  //         // print(namaMenu);R
  //         print(nama + " = " + namaMenu.toString());
  //       });
  //     },
  //     child: Container(
  //       alignment: Alignment.centerLeft,
  //       padding: const EdgeInsets.all(9.0),
  //       child: Text(
  //         nama,
  //         style: InfoTextStyle().textHeadv2,
  //         textAlign: TextAlign.left,
  //       ),
  //     ),
  //   );
  // }
}

_myText(String textku) {
  return Container(
    padding: const EdgeInsets.all(9.0),
    child: Text(textku, textAlign: TextAlign.justify),
  );
}

_rowText(String textku) {
  return Container(
      child: Row(
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(9.0),
        child: Icon(
          Icons.circle,
          size: 10,
        ),
      ),
      Expanded(child: Text(textku))
    ],
  ));
}
