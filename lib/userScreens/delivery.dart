import 'package:flutter/material.dart';

class PizzaTeslim extends StatefulWidget {
  @override
  _PizzaTeslimState createState() => _PizzaTeslimState();
}

class _PizzaTeslimState extends State<PizzaTeslim> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Teslimat Adresi'),
        centerTitle: false,
      ),
      body: Center(
        child: Text('Teslimat Adresi',style: TextStyle(fontSize: 25),),
      ),
    );
  }
}
