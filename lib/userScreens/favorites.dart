import 'package:flutter/material.dart';
class FavoritePizza extends StatefulWidget {
  @override
  _FavoritePizzaState createState() => _FavoritePizzaState();
}

class _FavoritePizzaState extends State<FavoritePizza> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Favorilerim'),
        centerTitle: false,
      ),
      body: Center(
        child: Text('Favorilerim',style: TextStyle(fontSize: 25),),
      ),
    );
  }
}
