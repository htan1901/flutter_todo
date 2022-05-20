import 'package:flutter/material.dart';
import 'package:todo/styles/text_style.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(255, 177, 163, 1),
        elevation: 0,
      ),
      body: buildBody(context),
    );
  }

  Widget buildBody(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/about.png'),
              scale: 0.5,
              alignment: Alignment.topCenter),
          color: Color.fromRGBO(255, 177, 163, 1)),
      child: Column(children: <Widget>[
        Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.only(top: 30, left: 30),
              alignment: Alignment.topLeft,
              child: const Text('Về ứng dụng này',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontFamily: 'SourceSansPro',
                      fontWeight: FontWeight.bold)),
            )),
        Expanded(
          flex: 3,
          child: Container(
            constraints: const BoxConstraints.expand(),
            padding: const EdgeInsets.only(
                top: 25,
                // left: 25,
                bottom: 75),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 50,
                  backgroundImage: AssetImage("assets/images/avt.png"),
                ),
                Text("Ứng dụng này được viết bởi Hoàng Tân", style: CustomTextStyle.aboutDescriptionStyle,),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
