import 'package:flutter/material.dart';
import 'package:test_app/models/todo.dart';
import 'package:test_app/themes/color_theme.dart';
import 'package:test_app/widgets/list_todo_widget.dart';
import 'package:test_app/widgets/todo_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: LightColorTheme.getMaterialBLueSwatch,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: buildDrawer(),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(0, 106, 216, 1),
        elevation: 0,
      ),
      body: buildBody(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
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
              image: AssetImage('assets/images/masthead.png'),
              alignment: Alignment.topCenter),
          color: Color.fromRGBO(0, 106, 216, 1)),
      child: Column(children: <Widget>[
        Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.only(top: 30, left: 30),
              alignment: Alignment.topLeft,
              child: Text('Xin chào, $userName',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontFamily: 'SourceSansPro',
                      fontWeight: FontWeight.bold)),
            )),
        Expanded(
          flex: 1,
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: ListView(
              children: [

              ],
            ),
          ),
        )
      ]),
    );
  }

  Widget buildDrawer() {
    return const Drawer();
  }
}
