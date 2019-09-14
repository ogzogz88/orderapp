import 'package:flutter/material.dart';

class privileges extends StatefulWidget {
  @override
  _privilegesState createState() => _privilegesState();
}

class _privilegesState extends State<privileges> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Yetkilendirme'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Yetkilendirme',style: TextStyle(fontSize: 25),),
      ),
    );
  }
}
