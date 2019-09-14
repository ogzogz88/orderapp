import 'package:flutter/material.dart';

class products extends StatefulWidget {
  @override
  _productsState createState() => _productsState();
}

class _productsState extends State<products> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Ürünler'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Ürünler',style: TextStyle(fontSize: 25),),
      ),
    );
  }
}
