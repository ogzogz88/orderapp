import 'package:flutter/material.dart';

class appMessages extends StatefulWidget {
  @override
  _appMessagesState createState() => _appMessagesState();
}

class _appMessagesState extends State<appMessages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Mesajlar'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Mesajlar',style: TextStyle(fontSize: 25),),
      ),
    );
  }
}
