import 'package:flutter/material.dart';
import 'package:test_app/models/todo.dart';
import 'package:test_app/themes/color_theme.dart';
import 'package:test_app/widgets/list_view_item.dart';

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
        // leading: IconButton(
        //   icon: Icon(Icons.menu_rounded),
        //   onPressed: () => Scaffold.of(context).openDrawer(),
        // ),
        backgroundColor: const Color.fromRGBO(0, 106, 216, 1),
        elevation: 0,
      ),
      body: buildBody(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
        tooltip: 'Thêm Một việc cần làm',
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    List<Todo> todos = [
      Todo(title: 'Clean house'),
      Todo(title: 'Throw trash', detail: 'Trash can is full'),
      Todo(
          title:
              'Cooking a fucking large chicken with some fucking deliciout mushroom and and and... I don\'t know',
          detail: 'Chicket sandwich'),
      Todo(title: 'Clean house'),
      Todo(title: 'Throw trash', detail: 'Trash can is full'),
      Todo(
          title:
              'Cooking a fucking large chicken with some fucking deliciout mushroom and and and... I don\'t know',
          detail: 'Chicket sandwich'),
      Todo(
          title:
              'Cooking a fucking large chicken with some fucking deliciout mushroom and and and... I don\'t know',
          detail: 'Chicket sandwich'),
    ];
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
            padding: const EdgeInsets.only(
                top: 25,
                // left: 25,
                bottom: 75),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                return Dismissible(
                    key: UniqueKey(),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {
                      if (direction == DismissDirection.startToEnd) {
                        setState(() {
                          todos.removeAt(index);
                        });
                      }
                    },
                    background: Container(
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.only(right: 15),
                      color: Colors.red,
                      child: const Icon(
                        Icons.delete_sweep,
                        color: Color.fromARGB(255, 255, 255, 255),
                        size: 35,
                      ),
                    ),
                    child: ListViewItem(todo: todos[index]));
              },
            ),
          ),
        )
      ]),
    );
  }

  Widget buildDrawer() {
    bool isSelected = true;
    return Drawer(
        child: SafeArea(
      child: Column(
        children: <Widget>[
          ButtonBar(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
          Container(
              padding: const EdgeInsets.only(top: 20),
              child: const CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/images/dogo.png'),
              )),
          Container(
            alignment: Alignment.center,
            child: const ListTile(
              title: Text(
                'Hoàng Tân',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
          ),
          ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.only(
              top: 40,
              left: 20,
              right: 20,
            ),
            children: [
              ListTile(
                tileColor: selectedColor(isSelected),
                leading:
                    Icon(Icons.task_alt, color: selectedColor(!isSelected)),
                title: Text('Việc cần làm',
                    style: drawerTileTextStyle(isSelected)),
                onTap: () {
                  setState(() {
                    isSelected = !isSelected;
                  });
                },
              ),
              ListTile(
                tileColor: selectedColor(!isSelected),
                leading:
                    Icon(Icons.help_outline, color: selectedColor(isSelected)),
                title: Text('Về ứng dụng',
                    style: drawerTileTextStyle(!isSelected)),
                onTap: () {
                  setState(() {
                    isSelected = !isSelected;
                  });
                },
              )
            ],
          )
        ],
      ),
    ));
  }

  Color selectedColor(bool isSelected) {
    return isSelected
        ? Color.fromRGBO(0, 106, 216, 1)
        : Color.fromARGB(255, 255, 255, 255);
  }

  TextStyle drawerTileTextStyle(bool isSelected) {
    if (isSelected) {
      return const TextStyle(fontSize: 17, color: Colors.white);
    }
    return const TextStyle(fontSize: 17, color: Color.fromRGBO(0, 106, 216, 1));
  }
}
