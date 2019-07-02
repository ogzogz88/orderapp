import 'package:flutter/material.dart';

class PizzaBildirim extends StatefulWidget {
  @override
  _PizzaBildirimState createState() => _PizzaBildirimState();
}

class _PizzaBildirimState extends State<PizzaBildirim> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Bildirimler'),
        centerTitle: false,
      ),
      body: Center(
        child: Text('Bildirimler',style: TextStyle(fontSize: 25),),
      ),
    );
  }
}
