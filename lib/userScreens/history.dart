import 'package:flutter/material.dart';

class PizzaHistory extends StatefulWidget {
  @override
  _PizzaHistoryState createState() => _PizzaHistoryState();
}

class _PizzaHistoryState extends State<PizzaHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Sipariş Geçmişi'),
        centerTitle: false,
      ),
      body: Center(
        child: Text('Sipariş Geçmişi',style: TextStyle(fontSize: 25),),
      ),
    );
  }
}
