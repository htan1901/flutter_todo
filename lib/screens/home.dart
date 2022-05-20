import 'package:flutter/material.dart';
import 'package:todo/samples/todo_data.dart';
import 'package:todo/widgets/drawer.dart';
import 'package:todo/widgets/list_view_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
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
              itemCount: TodoData.todos.length,
              itemBuilder: (context, index) {
                return Dismissible(
                    key: UniqueKey(),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {
                      if (direction == DismissDirection.startToEnd) {
                        setState(() {
                          TodoData.todos.removeAt(index);
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
                    child: ListViewItem(todo: TodoData.todos[index]));
              },
            ),
          ),
        )
      ]),
    );
  }

}