
import 'package:applicationquestion/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
//import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(Phoenix(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Ubuntu'),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),

    );
  }

}

