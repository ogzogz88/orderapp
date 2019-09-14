import 'package:flutter/material.dart';

class searchData extends StatefulWidget {
  @override
  _searchDataState createState() => _searchDataState();
}

class _searchDataState extends State<searchData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Arama Yap'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Arama Yap',style: TextStyle(fontSize: 25),),
      ),
    );
  }
}
