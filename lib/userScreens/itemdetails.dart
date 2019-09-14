import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'cart.dart';

class ItemDetail extends StatefulWidget {
  String itemName;
  String itemDescription;
  double itemPrice;
  String itemImage;
  String itemSubName;
  double itemRating;

  ItemDetail(this.itemName, this.itemPrice, this.itemImage, this.itemRating,
      this.itemSubName,this.itemDescription);

  @override
  _ItemDetailState createState() => _ItemDetailState();
}

class _ItemDetailState extends State<ItemDetail> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Ürün Detayları'),
        centerTitle: false,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        color: Colors.orange,
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            IntrinsicWidth(
              child: Container(
                height: 250,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.orange,
                ),
                child: Image(
                  image: CachedNetworkImageProvider(
                    widget.itemImage,
                  ),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            /* Container(
              height: 300,
              decoration: BoxDecoration(
                color: Colors.orange.withAlpha(80),
              ),
            ),*/
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  new SizedBox(
                    height: 200.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.orange, width: 2),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),

                    //alignment: Alignment.center,
                    child: new Container(
                      width: screenSize.width,
                      margin: new EdgeInsets.only(left: 20.0, right: 20.0),
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new SizedBox(
                            height: 10.0,
                          ),
                          new Text(
                            widget.itemName,
                            style: new TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.w700),
                          ),
                          new SizedBox(
                            height: 10.0,
                          ),
                          new Text(
                            widget.itemDescription,
                            style: new TextStyle(
                                fontSize: 14.0, fontWeight: FontWeight.w400),
                          ),
                          new SizedBox(
                            height: 10.0,
                          ),
                          new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              new Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  new Icon(
                                    Icons.star,
                                    color: Colors.blue,
                                    size: 20.0,
                                  ),
                                  new SizedBox(
                                    width: 5.0,
                                  ),
                                  new Text(
                                    "${widget.itemRating}",
                                    style: new TextStyle(color: Colors.black),
                                  )
                                ],
                              ),
                              new Text(
                                "${widget.itemPrice} TL",
                                style: new TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.deepOrange,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                          new SizedBox(
                            height: 10.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                  new Container(
                    decoration: BoxDecoration(color: Colors.white),
                    child: new Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.orange, width: 2),
                      ),
                      padding: EdgeInsets.all(5),
                      width: screenSize.width,
                      height: 140.0,
                      child: new ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return new Stack(
                              alignment: Alignment.center,
                              children: <Widget>[
                                new Container(
                                  margin: EdgeInsets.all(5),
                                  padding: EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      shape: BoxShape.rectangle,
                                      image: DecorationImage(
                                          image: CachedNetworkImageProvider(
                                              widget.itemImage),
                                          fit: BoxFit.fill),
                                      borderRadius: BorderRadius.circular(5)),

                                  // margin:   new EdgeInsets.only(left: 5.0, right: 5.0),
                                  height: 150.0,
                                  width: 120.0,
                                  //child: Image(image: CachedNetworkImageProvider(widget.itemImage),fit: BoxFit.fill,),//new Image.network(widget.itemImage),
                                ),
                                /*  new Container(
                                  margin:
                                      new EdgeInsets.only(left: 5.0, right: 5.0),
                                  height: 140.0,
                                  width: 100.0,
                                  decoration: new BoxDecoration(
                                      color: Colors.grey.withAlpha(50)),
                                ),*/
                              ],
                            );
                          }),
                    ),
                  ),
                  /* new Card(
                    child: new Container(
                      width: screenSize.width,
                      margin: new EdgeInsets.only(left: 20.0, right: 20.0),
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new SizedBox(
                            height: 10.0,
                          ),
                          new Text(
                            "Description",
                            style: new TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.w700),
                          ),
                          new SizedBox(
                            height: 10.0,
                          ),
                          new Text(
                            "My item full information",
                            style: new TextStyle(
                                fontSize: 14.0, fontWeight: FontWeight.w400),
                          ),
                          new SizedBox(
                            height: 10.0,
                          ),
                        ],
                      ),
                    ),
                  ),*/
                  new Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.orange, width: 2),
                    ),
                    child: new Container(
                      width: screenSize.width,
                      margin: new EdgeInsets.only(left: 20.0, right: 20.0),
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new SizedBox(
                            height: 10.0,
                          ),
                          new Text(
                            "Hamur Seçimi",
                            style: new TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.w700),
                          ),
                          new SizedBox(
                            height: 10.0,
                          ),
                          new SizedBox(
                            height: 50.0,
                            child: new ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 2,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: new ChoiceChip(
                                        label: index == 0
                                            ? new Text("ince Hamur")
                                            : new Text("Kalın Hamur"),
                                        selected: false),
                                  );
                                }),
                          ),
                          new SizedBox(
                            height: 10.0,
                          ),
                          new Text(
                            "Boyut Seçimi",
                            style: new TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.w700),
                          ),
                          new SizedBox(
                            height: 10.0,
                          ),
                          new SizedBox(
                            height: 50.0,
                            child: new ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 3,
                                itemBuilder: (context, index) {
                                  switch (index) {
                                    case 0:
                                      return Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: new ChoiceChip(
                                            label:
                                                new Text("${index + 1}- Küçük"),
                                            selected: false),
                                      );
                                      break;
                                    case 1:
                                      return Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: ChoiceChip(
                                            label:
                                                new Text("${index + 1}- Orta "),
                                            selected: false),
                                      );
                                      break;
                                    case 2:
                                      return Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: ChoiceChip(
                                            label:
                                                new Text("${index + 1}- Büyük"),
                                            selected: false),
                                      );
                                      break;
                                  }
                                }),
                          ),
                          new SizedBox(
                            height: 10.0,
                          ),
                          new Text(
                            "Boyut Seç",
                            style: new TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.w700),
                          ),
                          new SizedBox(
                            height: 10.0,
                          ),
                          new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              new CircleAvatar(
                                child: new Icon(Icons.remove),
                              ),
                              new Text("0"),
                              new CircleAvatar(
                                child: new Icon(Icons.add),
                              ),
                            ],
                          ),
                          new SizedBox(
                            height: 50.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
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
                      MaterialPageRoute(builder: (context) => PizzaCart()));
                },
              ),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => PizzaCart()));
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
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).primaryColor,
        elevation: 0.0,
        shape: CircularNotchedRectangle(),
        notchMargin: 5.0,
        child: Container(
          height: 50,
          decoration: BoxDecoration(color: Colors.orange),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: (screenSize.width - 20) / 2,
                child: Container(
                  margin: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Text(
                    'Favorilere Ekle',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              Container(
                width: (screenSize.width - 20) / 2,
                child: Container(
                  margin: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Text(
                    'Sipariş Ver',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
