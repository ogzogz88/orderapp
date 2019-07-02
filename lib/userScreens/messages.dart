import 'package:flutter/material.dart';

class PizzaMesaj extends StatefulWidget {
  @override
  _PizzaMesajState createState() => _PizzaMesajState();
}

class _PizzaMesajState extends State<PizzaMesaj> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Mesajlarım'),
        centerTitle: false,
      ),
      body: Center(
        child: Text('Mesajlarım',style: TextStyle(fontSize: 25),),
      ),
    );
  }
}
