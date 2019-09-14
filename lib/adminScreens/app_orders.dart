import 'package:flutter/material.dart';

class appOrders extends StatefulWidget {
  @override
  _appOrdersState createState() => _appOrdersState();
}

class _appOrdersState extends State<appOrders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Siparişler'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Siparişler',style: TextStyle(fontSize: 25),),
      ),
    );
  }
}
