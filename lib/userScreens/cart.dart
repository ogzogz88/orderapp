import 'package:flutter/material.dart';

class PizzaCart extends StatefulWidget {
  @override
  _PizzaCartState createState() => _PizzaCartState();
}

class _PizzaCartState extends State<PizzaCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Sepetimdekiler'),
        centerTitle: false,
      ),
      body: Center(
        child: Text('Sepetimdekiler',style: TextStyle(fontSize: 25),),
      ),
    );
  }
}
