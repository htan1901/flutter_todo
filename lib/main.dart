import 'package:flutter/material.dart';
import 'package:todo/screens/home.dart';
import 'package:todo/themes/color_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: LightColorTheme.getMaterialBLueSwatch,
      ),
      home: const HomePage(),
    );
  }
}
