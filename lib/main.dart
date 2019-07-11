import 'package:flutter/material.dart';
import 'userScreens/myHomePage.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pizzacım',


      theme: ThemeData(


        primarySwatch: Colors.deepOrange,
        fontFamily: 'Raleway',
      ),
      home: MyHomePage(),
    );
  }
}

