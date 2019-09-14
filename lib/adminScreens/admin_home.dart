import 'package:flutter/material.dart';
import 'package:orderapp/adminScreens/search_data.dart';
import 'package:orderapp/userScreens/notification.dart';

import 'add_products.dart';
import 'app_messages.dart';
import 'app_orders.dart';
import 'app_users.dart';
import 'order_history.dart';
import 'privileges.dart';
import 'products.dart';

class adminHome extends StatefulWidget {
  @override
  _adminHomeState createState() => _adminHomeState();
}

class _adminHomeState extends State<adminHome> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
//backgroundColor: Colors.orange,
          title: Text("Yönetici İşlemleri"),
          centerTitle: true,
        ),
        endDrawer: Container(
            width: screenSize.width - 50,
            color: Colors.white,
            child: Column(
              children: <Widget>[
                UserAccountsDrawerHeader(
                    currentAccountPicture: CircleAvatar(
                      child: Icon(Icons.person),
                      backgroundColor: Colors.white,
                    ),
                    accountName: Text("Uygulama Yöneticisi"),
                    accountEmail: Text("support@pizzacım.com")),
                ListTile(
                  leading: CircleAvatar(
                    child: Icon(
                      Icons.notifications,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  title: Text('Sipariş Bildirimi'),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext) => PizzaBildirim()));
                  },
                ),
              ],
            )),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 7, 0, 7),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    GestureDetector(

                      child: CircleAvatar(

                        backgroundColor: Colors.orange,
                        maxRadius: (screenSize.height/5)-67,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.search,color: Colors.white,),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Arama Yap",style: TextStyle(color:Colors.white ),),
                          ],
                        ),
                      ),
                      onTap:(){
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => searchData()));
                      },
                    ),
                    GestureDetector(
                      child: CircleAvatar(

                        backgroundColor: Colors.orange,
                        maxRadius: (screenSize.height/5)-67,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.person,color: Colors.white,),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Kullanıcılar",style: TextStyle(color:Colors.white ),),
                          ],
                        ),
                      ),
                      onTap:(){
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => appUsers()));
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 7, 0, 7),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    GestureDetector(
                      child: CircleAvatar(
                        backgroundColor: Colors.orange,
                        maxRadius: (screenSize.height/5)-67,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.notifications,color: Colors.white,),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Siparişler",style: TextStyle(color:Colors.white ),),
                          ],
                        ),
                      ),
                      onTap:(){
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => appOrders()));
                      },
                    ),
                    GestureDetector(
                      child: CircleAvatar(
                        backgroundColor: Colors.orange,
                        maxRadius: (screenSize.height/5)-67,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.message,color: Colors.white,),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Mesajlar",style: TextStyle(color:Colors.white ),),
                          ],
                        ),
                      ),
                      onTap:(){
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => appMessages()));
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 7, 0, 7),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    GestureDetector(
                      child: CircleAvatar(
                        backgroundColor: Colors.orange,
                        maxRadius: (screenSize.height/5)-67,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.shop,color: Colors.white,),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Ürünler",style: TextStyle(color:Colors.white ),),
                          ],
                        ),
                      ),
                      onTap:(){
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => products()));
                      },

                    ),
                    GestureDetector(
                      child: CircleAvatar(
                        backgroundColor: Colors.orange,
                        maxRadius: (screenSize.height/5)-66,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.add_box,color: Colors.white,),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Ürün Ekle",style: TextStyle(color:Colors.white ),),
                          ],
                        ),
                      ),
                      onTap:(){
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => addProducts()));
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 7, 0, 7),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    GestureDetector(
                      child: CircleAvatar(
                        backgroundColor: Colors.orange,
                        maxRadius: (screenSize.height/5)-67,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.history,color: Colors.white,),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Sipariş \nGeçmişi",style: TextStyle(color:Colors.white, ),textAlign: TextAlign.center,),
                          ],
                        ),
                      ),
                      onTap:(){
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => orderHistory()));
                      },
                    ),
                    GestureDetector(
                      child: CircleAvatar(
                        backgroundColor: Colors.orange,
                        maxRadius: (screenSize.height/5)-67,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.all_inclusive,color: Colors.white,),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Yetkiler",style: TextStyle(color:Colors.white ),),
                          ],
                        ),

                      ),
                      onTap:(){
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => privileges()));
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
