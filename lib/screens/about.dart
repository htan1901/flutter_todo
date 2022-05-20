import 'package:flutter/material.dart';
import 'package:todo/widgets/drawer.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(0, 106, 216, 1),
        elevation: 0,
      ),
      body: buildBody(context),
    );
  }

  Widget buildBody(BuildContext context) {
    String userName = 'Hoàng Tân';
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/about.png'),
              scale: 0.5,
              alignment: Alignment.topCenter),
          color: Color.fromRGBO(0, 106, 216, 1)),
      child: Column(children: <Widget>[
        Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.only(top: 30, left: 30),
              alignment: Alignment.topLeft,
              child: Text('Về ứng dụng này',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontFamily: 'SourceSansPro',
                      fontWeight: FontWeight.bold)),
            )),
        Expanded(
          flex: 1,
          child: Container(
            padding: const EdgeInsets.only(
                top: 25,
                // left: 25,
                bottom: 75),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
          ),
        )
      ]),
    );
  }
}
