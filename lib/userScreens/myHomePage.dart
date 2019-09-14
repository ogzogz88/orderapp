import 'package:flutter/material.dart';
import 'package:orderapp/adminScreens/admin_home.dart';
import 'package:orderapp/tools/Store.dart';
import 'package:orderapp/tools/app_methods.dart';
import 'package:orderapp/tools/app_tools.dart';
import 'package:orderapp/tools/firebase_methods.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'itemdetails.dart';
import 'profile.dart';
import 'favorites.dart';
import 'messages.dart';
import 'cart.dart';
import 'notification.dart';
import 'history.dart';
import 'delivery.dart';
import 'aboutUs.dart';
import 'login.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:orderapp/tools/app_data.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  BuildContext context;
  String acctName = '';
  String acctEmail = '';
  String acctPhotoURL = '';
  bool isLoggedIn;
  AppMethods appMethods = new FireBaseMethods();



  @override
  void initState() {
    // TODO: implement initState
    getCurrentUser();
    super.initState();
  }

  Future getCurrentUser() async {
    acctName = await getStringDataLocally(key: userFullName);
    acctEmail = await getStringDataLocally(key: emailAddres);
    acctPhotoURL = await getStringDataLocally(key: photoURL);
    isLoggedIn = await getBoolDataLocally(key: loggedIn);

    acctName == null ? acctName = "Misafir Kullanıcı" : acctName;
    acctEmail == null ? acctEmail = "misafirkullanıcı@email.com" : acctEmail;

    // final SharedPreferences localData = await saveLocal;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(onLongPress: openAdmin, child: Text('Pizzacım')),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.favorite,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext) => FavoritePizza()));
              }),
          Stack(
            alignment: Alignment.topLeft,
            children: <Widget>[
              IconButton(
                  icon: Icon(
                    Icons.chat_bubble,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext) => PizzaMesaj()));
                  }),
              CircleAvatar(
                radius: 10,
                backgroundColor: Colors.red,
                child: Text(
                  '0',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.orange,
              ),
              padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  FlutterLogo(
                    style: FlutterLogoStyle.markOnly,
                    size: 50,
                    colors: Colors.deepOrange,
                  ),
                  Text(
                    'Pizza Çeşitlerimiz',
                    style: TextStyle(fontSize: 25),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
              child: GridView.builder(
                itemCount: storeItems.length,
                gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              ItemDetail(
                                storeItems[index].itemName,
                                storeItems[index].itemPrice,
                                storeItems[index].itemImage,
                                storeItems[index].itemRating,
                                storeItems[index].itemName,
                                storeItems[index].itemDescription,
                              )));
                    },
                    child: Card(
                      //  margin: EdgeInsets.all(10),

                      elevation: 5,
                      child: Stack(
                        alignment: Alignment.topLeft,
                        children: <Widget>[
                          Stack(
                            alignment: Alignment.bottomCenter,
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: CachedNetworkImageProvider(
                                            '${storeItems[index].itemImage}'))),
                              ),
                              Container(
                                color: Colors.orange.withAlpha(200),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        storeItems[index].itemName,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      ),
                                      Text(
                                        '${storeItems[index].itemPrice} TL',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red,
                                            fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.deepOrange.withAlpha(200),
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      bottomRight: Radius.circular(10),
                                    )),
                                height: 30,
                                width: 60,
                                child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Icon(
                                        Icons.star,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                      Text(
                                        ' ${storeItems[index].itemRating}',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      )
                                    ]),
                              ),
                              Container(
                                child: Icon(
                                  Icons.favorite,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )),
          Container(
            margin: EdgeInsets.all(4),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.orange,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    FlutterLogo(
                      style: FlutterLogoStyle.markOnly,
                      size: 20,
                      colors: Colors.deepOrange,
                    ),
                    Text(
                      'www.pizzacım.com',
                      style: TextStyle(fontSize: 10),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Stack(
        alignment: Alignment.topLeft,
        children: <Widget>[
          FloatingActionButton(
            child: IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (BuildContext) => PizzaCart()));
              },
            ),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext) => PizzaCart()));
            },
          ),
          CircleAvatar(
            radius: 10,
            backgroundColor: Colors.red,
            child: Text(
              '0',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              UserAccountsDrawerHeader(
                  currentAccountPicture: CircleAvatar(
                    child: Icon(Icons.person),
                    backgroundColor: Colors.white,
                  ),
                  accountName: Text(acctName),
                  accountEmail: Text(acctEmail)),
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
              ListTile(
                leading: CircleAvatar(
                  child: Icon(
                    Icons.history,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                title: Text('Sipariş Geçmişi'),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext) => PizzaHistory()));
                },
              ),
              Divider(
                color: Colors.deepOrangeAccent,
                height: 2,
              ),
              ListTile(
                leading: CircleAvatar(
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                title: Text('Profil Ayarları'),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext) => PizzaProfil()));
                },
              ),
              ListTile(
                leading: CircleAvatar(
                  child: Icon(
                    Icons.home,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                title: Text('Teslimat Adresi'),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext) => PizzaTeslim()));
                },
              ),
              Divider(
                color: Colors.deepOrangeAccent,
                height: 2,
              ),
              ListTile(
                trailing: CircleAvatar(
                  child: Icon(
                    Icons.help,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                title: Text('Hakkımızda'),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Hakkimizda()));
                },
              ),
              ListTile(
                trailing: CircleAvatar(
                  child: Icon(
                    Icons.exit_to_app,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                title: Text(isLoggedIn == true ? 'Çıkış Yap' : 'Giriş Yap'),
                onTap: checkIfLoggedIn,
              ),
            ],
          ),
        ),
      ),
    );
  }

  checkIfLoggedIn() async {
    if (isLoggedIn == false) {
      bool response = await Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => LoginLogout()));
      if (response == true) getCurrentUser();
      return;
    }

    bool response = await appMethods.logOutUser();
    if (response == true) getCurrentUser();
  }

  openAdmin() {
    if(acctName=="pizzaAdmin"){
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => adminHome()));
    }
     else {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Hakkimizda()));
    }



  }
}
