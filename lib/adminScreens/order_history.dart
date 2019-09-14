import 'package:flutter/material.dart';

class orderHistory extends StatefulWidget {
  @override
  _orderHistoryState createState() => _orderHistoryState();
}

class _orderHistoryState extends State<orderHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Sipariş Geçmişi'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Sipariş Geçmişi',style: TextStyle(fontSize: 25),),
      ),
    );
  }
}
