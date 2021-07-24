import 'package:flutter/material.dart';
import 'package:tensys/style/text_style.dart';

class ContentHeading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(5, 0, 5, 10),
        height: 160,
        // decoration: BoxDecoration(color: Colors.blue),
        alignment: Alignment.center,
        child: Container(
          height: 150,
          width: 330,
          // decoration: BoxDecoration(color: Colors.yellow),
          child: Stack(
            children: <Widget>[
              Positioned(
                  bottom: 0,
                  left: 0,
                  top: 40,
                  child: Container(
                    width: 330,
                    decoration: BoxDecoration(
                        color: Colors.blueAccent[100],
                        // border: Border.all(),
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(20),
                            topLeft: Radius.circular(20))),
                  )),
              Positioned(
                left: 150,
                top: 40,
                right: 0,
                bottom: 0,
                child: Container(
                  height: 150,
                  width: 300,
                  padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                  decoration: BoxDecoration(color: Colors.transparent),
                  // width: MediaQuery.of(context).size.width * 0.9,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Hai, nama',style: MyDefaultTextStyle().texth1,),
                      Text(
                          'Loremipsum ooinfhobfof bwbf ioqwfbfobf iwfpwbnfiw npfqbn pw qp'),
                      Text('degqg')
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 3,
                left: -15,
                top: 0,
                child: Image.asset('assets/images/doctor.png'),
              ),
            ],
          ),
        ));
  }
}
