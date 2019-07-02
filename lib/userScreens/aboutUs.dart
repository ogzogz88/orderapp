import 'package:flutter/material.dart';

class Hakkimizda extends StatefulWidget {
  @override
  _HakkimizdaState createState() => _HakkimizdaState();
}

class _HakkimizdaState extends State<Hakkimizda> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Hakkımızda'),
        centerTitle: false,
      ),
      body: Center(
        child: Text('Hakkımızda',style: TextStyle(fontSize: 25),),
      ),
    );
  }
}
