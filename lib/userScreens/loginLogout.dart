import 'package:flutter/material.dart';

class LoginLogout extends StatefulWidget {
  @override
  _LoginLogoutState createState() => _LoginLogoutState();
}

class _LoginLogoutState extends State<LoginLogout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Çıkış'),
        centerTitle: false,
      ),
      body: Center(
        child: Text('Çıkış',style: TextStyle(fontSize: 25),),
      ),
    );
  }
}
