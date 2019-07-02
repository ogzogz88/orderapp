import 'package:flutter/material.dart';

class PizzaProfil extends StatefulWidget {
  @override
  _PizzaProfilState createState() => _PizzaProfilState();
}

class _PizzaProfilState extends State<PizzaProfil> {
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
