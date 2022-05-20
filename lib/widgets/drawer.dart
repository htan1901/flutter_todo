import 'package:flutter/material.dart';
import 'package:todo/screens/about.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  bool _isSelected = true;
  @override
  Widget build(BuildContext context) {
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
                backgroundColor: Colors.white,
                radius: 30,
                backgroundImage: AssetImage('assets/images/avt.png'),
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
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                tileColor: selectedColor(_isSelected),
                leading:
                    Icon(Icons.task_alt, color: selectedColor(!_isSelected)),
                title: Text('Việc cần làm',
                    style: drawerTileTextStyle(_isSelected)),
                onTap: () {
                  setState(() {
                    _isSelected = !_isSelected;
                  });
                },
              ),
              ListTile(
                tileColor: selectedColor(!_isSelected),
                leading:
                    Icon(Icons.help_outline, color: selectedColor(_isSelected)),
                title: Text('Về ứng dụng',
                    style: drawerTileTextStyle(!_isSelected)),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => const AboutPage())));
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
