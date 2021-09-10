import 'package:flutter/material.dart';
import 'package:tensys/home_page/profile_contets/contents_heading.dart';
import 'package:tensys/style/color_style.dart';
import 'package:tensys/style/text_style.dart';

class HomeProfile extends StatelessWidget {
  final String profileNIK;
  final String profileLahir;
  final String profileKelamin;
  final String profileAlamat;
  final String profileEmail;
  final String profileTelp;
  final String profilePekerjaan;
  final String userName;
  final String isWeb;

  HomeProfile(
      {required this.profileNIK,
      required this.profileLahir,
      required this.profileKelamin,
      required this.profileAlamat,
      required this.profileEmail,
      required this.profileTelp,
      required this.profilePekerjaan,
      required this.userName,
      required this.isWeb
      });
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ProfileHeading(
              userName: userName,
            ),
            ProfileContent(
              profileAlamat: this.profileAlamat,
              profileEmail: this.profileEmail,
              profileKelamin: this.profileKelamin,
              profileLahir: this.profileLahir,
              profileNIK: this.profileNIK,
              profilePekerjaan: this.profilePekerjaan,
              profileTelp: this.profileTelp,
              isWeb: this.isWeb,
            ),
          ],
        ));
  }
}

class ProfileContent extends StatefulWidget {
  final String profileNIK;
  final String profileLahir;
  final String profileKelamin;
  final String profileAlamat;
  final String profileEmail;
  final String profileTelp;
  final String profilePekerjaan;
  final String isWeb;
  ProfileContent({
    required this.profileNIK,
    required this.profileLahir,
    required this.profileKelamin,
    required this.profileAlamat,
    required this.profileEmail,
    required this.profileTelp,
    required this.profilePekerjaan,
    required this.isWeb
  });
  @override
  _ProfileContentState createState() => _ProfileContentState();
}

class _ProfileContentState extends State<ProfileContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.isWeb == "small" ? 300:widget.isWeb=="mid"?300:200,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.fromLTRB(
          15, 15, 15, 15), // decoration: BoxDecoration(color: Colors.yellow),
      margin: EdgeInsets.fromLTRB(15, 10, 15, 10),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: MyColorStyle().sistolik, width: 4),
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
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Biodata",
                  style: MyDefaultTextStyle().headline5,
                ),
                Icon(Icons.arrow_drop_down)
              ],
            ),
          ),
          Expanded(
            child: Container(
                alignment: Alignment.center,
                child: GridView.count(
                  crossAxisSpacing: 50,
                  childAspectRatio: widget.isWeb == "small" ? 15:widget.isWeb=="mid"?17:20,
                  shrinkWrap: true,
                  crossAxisCount: widget.isWeb == "small" ? 1:widget.isWeb=="mid"?1:2,
                  children: <Widget>[
                    ProfileTextContent(
                        textContentLeft: "NIK",
                        textContentRight: widget.profileNIK),
                    ProfileTextContent(
                        textContentLeft: "Tempat, Tanggal Lahir",
                        textContentRight: widget.profileLahir),
                    ProfileTextContent(
                        textContentLeft: "Jenis Kelamin",
                        textContentRight: widget.profileKelamin),
                    ProfileTextContent(
                        textContentLeft: "Alamat",
                        textContentRight: widget.profileAlamat),
                    ProfileTextContent(
                        textContentLeft: "Email",
                        textContentRight: widget.profileEmail),
                    ProfileTextContent(
                        textContentLeft: "No.Telp",
                        textContentRight: widget.profileTelp),
                    ProfileTextContent(
                        textContentLeft: "Pekerjaan",
                        textContentRight: widget.profilePekerjaan),
                  ],
                )
                // Column(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: <Widget>[
                //     ProfileTextContent(
                //         textContentLeft: "NIK",
                //         textContentRight: widget.profileNIK),
                //     ProfileTextContent(
                //         textContentLeft: "Tempat, Tanggal Lahir",
                //         textContentRight: widget.profileLahir),
                //     ProfileTextContent(
                //         textContentLeft: "Jenis Kelamin",
                //         textContentRight: widget.profileKelamin),
                //     ProfileTextContent(
                //         textContentLeft: "Alamat",
                //         textContentRight: widget.profileAlamat),
                //     ProfileTextContent(
                //         textContentLeft: "Email",
                //         textContentRight: widget.profileEmail),
                //     ProfileTextContent(
                //         textContentLeft: "No.Telp",
                //         textContentRight: widget.profileTelp),
                //     ProfileTextContent(
                //         textContentLeft: "Pekerjaan",
                //         textContentRight: widget.profilePekerjaan),
                //   ],
                // ),
                ),
          ),
        ],
      ),
    );
  }
}

class ProfileTextContent extends StatelessWidget {
  final String textContentLeft;
  final String textContentRight;
  ProfileTextContent(
      {required this.textContentLeft, required this.textContentRight});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: Text(textContentLeft, style: MyDefaultTextStyle().bodyText2),
          ),
          Expanded(
              child: Text(textContentRight,
                  textAlign: TextAlign.right,
                  style: MyDefaultTextStyle().bodyText2))
        ],
      ),
    );
  }
}
