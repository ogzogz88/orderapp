import 'package:flutter/material.dart';

class appUsers extends StatefulWidget {
  @override
  _appUsersState createState() => _appUsersState();
}

class _appUsersState extends State<appUsers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Kullanıcılar'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Kullanıcılar',style: TextStyle(fontSize: 25),),
      ),
    );
  }
}
