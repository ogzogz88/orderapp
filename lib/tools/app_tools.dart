import 'dart:io';

import 'package:flutter/material.dart';
import 'package:orderapp/tools/progressDialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

Widget appTextField({
  Icon textIcon,
  String textHint,
  bool isPassword,
  double sidePadding,
  TextEditingController mycontroller,
  TextInputType textType,
}) {
  sidePadding == null ? sidePadding = 0.0 : sidePadding;
  textHint == null ? textHint = "" : textHint;
  textType == null ? textType = TextInputType.text : textType;

  return Padding(
    padding: new EdgeInsets.only(left: sidePadding, right: sidePadding),
    child: new Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: TextField(
        keyboardType: textType == null ? TextInputType.text : textType,
        controller: mycontroller,
        autofocus: true,
        obscureText: isPassword == null ? false : isPassword,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: textHint,
          prefixIcon: textIcon == null ? Container() : textIcon,

          // suffixIcon: isPassword == true ? new IconButton(icon: null, onPressed: null) : ,
        ),
      ),
    ),
  );
}

Widget appButton(
    {String btnTxt,
    double btnPadding,
    Color btnColor,
    VoidCallback onBtnClicked}) {
  btnTxt == null ? btnTxt = "App Button" : btnTxt;
  btnPadding == null ? btnPadding = 0.0 : btnPadding;
  btnColor == null ? btnColor = Colors.black : btnColor;

  return Padding(
    padding: new EdgeInsets.only(left: btnPadding, right: btnPadding),
    child: RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      // shape:  OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15),),),

      color: Colors.white,

      highlightElevation: 10,
      disabledElevation: 20,
      // clipBehavior: Clip.antiAlias,
      disabledColor: Colors.white,
      elevation: 30,

      splashColor: Colors.white,
      onPressed: onBtnClicked,
      child: Container(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Text(
          btnTxt,
          style: TextStyle(color: btnColor, fontSize: 18),
        ),
      ),
    ),
  );
}

Widget productTextField(
    {String productTitle,
    double productHeight,
    String productHintText,
    TextInputType textType,
    TextEditingController productController}) {
  productTitle == null ? productTitle = 'Enter TextTitle' : productTitle;
  productHintText == null ? productHintText = 'Enter Hint' : productHintText;
  productHeight == null ? productHeight = 50 : productHeight;


  return Column(
    children: <Widget>[
      Padding(
        padding: EdgeInsets.all(8),
        child: Text(
          productTitle,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
      Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Container(
            height: productHeight,
            decoration: BoxDecoration(color: Colors.black12),
            child: Padding(
                padding: EdgeInsets.only(left: 8, right: 8),
                child: TextField(
                  controller: productController,
                  keyboardType:
                      textType == null ? TextInputType.text : textType,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: productHintText,
                  ),
                )),
          )),
    ],
  );
}

Widget productDropDown({
  String dropDownTitle,
  String selectedItem,
  List<DropdownMenuItem<String>> dropDownItems,
  ValueChanged<String> changedDropDownItems,
}) {
  dropDownTitle == null ? dropDownTitle = 'Enter TextTitle' : dropDownTitle;

  return Container(
    //alignment: Alignment.center,
    padding: EdgeInsets.all(5),

    margin: EdgeInsets.all(5),


    decoration: BoxDecoration(
        color: Colors.deepOrangeAccent,
        borderRadius: BorderRadius.all(Radius.circular(10))),

    child: Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(5),
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              padding: EdgeInsets.all(8),
              child: Text(
                dropDownTitle,
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: Colors.deepOrange),
              )),
        ),
        Padding(
          padding: EdgeInsets.only(left: 5, right: 5),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.all(Radius.circular(10))),

            padding: EdgeInsets.only(right: 15, left: 15),

            margin: EdgeInsets.all(5),

            //  alignment: Alignment.center,

            child: DropdownButtonHideUnderline(
              child: DropdownButton(

                  isExpanded: true,
                  // elevation: 20,
                  icon: Icon(
                    Icons.expand_more,
                    color: Colors.white,
                    size: 25,
                  ),
                  items: dropDownItems,
                  value: selectedItem,
                  onChanged: changedDropDownItems),
            ),
          ),
        ),
      ],
    ),
  );
}

List<DropdownMenuItem<String>> buildAndGetDropDownOz1(List itemList) {
  List<DropdownMenuItem<String>> items = List();
  for (String size in itemList) {
    items.add(DropdownMenuItem(
      child: Text(
        size,
        style: TextStyle(
          fontSize: 12,
          color: Colors.black,
        ),
      ),
      value: size,
    ));
  }
  return items;
}

List<DropdownMenuItem<String>> buildAndGetDropDownOz2(List itemList) {
  List<DropdownMenuItem<String>> items = List();
  for (String size in itemList) {
    items.add(DropdownMenuItem(
      child: Text(
        size,
        style: TextStyle(
          fontSize: 12,
          color: Colors.black,
        ),
      ),
      value: size,
    ));
  }
  return items;
}

Widget MultiImagePickerList(
    {List<File> imageList, VoidCallback removeNewImage(int position)}) {
  return new Padding(
    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
    child: imageList == null || imageList.length == 0
        ? new Container()
        : new SizedBox(
      height: 150.0,
      child: new ListView.builder(
          itemCount: imageList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return new Padding(
              padding: new EdgeInsets.only(left: 3.0, right: 3.0),
              child: new Stack(
                children: <Widget>[
                  new Container(
                    width: 150.0,
                    height: 150.0,
                    decoration: new BoxDecoration(
                        color: Colors.grey.withAlpha(100),
                        borderRadius: new BorderRadius.all(
                            new Radius.circular(15.0)),
                        image: new DecorationImage(
                            fit: BoxFit.cover,
                            image: new FileImage(imageList[index]))),
                  ),
                  new Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: new CircleAvatar(
                      backgroundColor: Colors.red[600],
                      child: new IconButton(
                          icon: new Icon(
                            Icons.clear,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            removeNewImage(index);
                          }),
                    ),
                  )
                ],
              ),
            );
          }),
    ),
  );
}

Widget MultiImagePickerMap(
    {Map<int, File> imageList,
      VoidCallback addNewImage(int position),
      VoidCallback removeNewImage(int position)}) {
  int imageLength = imageList.isEmpty ? 1 : imageList.length + 1;
  bool isNull = imageList.isEmpty ? true : false;

  print("Image length is $imageLength");

  return new Padding(
    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
    child: new SizedBox(
      height: 150.0,
      child: new ListView.builder(
          itemCount: imageLength,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return imageList.isEmpty || imageList[index] == null
                ? new Padding(
              padding: new EdgeInsets.only(left: 3.0, right: 3.0),
              child: new GestureDetector(
                onTap: () {
                  addNewImage(index);
                },
                child: new Container(
                  width: 150.0,
                  height: 150.0,
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      new Icon(
                        Icons.image,
                        size: 150.0,
                        color: Theme.of(context).primaryColor,
                      ),
                      new Icon(
                        Icons.add_circle,
                        size: 25.0,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                    new BorderRadius.all(new Radius.circular(15.0)),
                  ),
                ),
              ),
            )
                : new Padding(
              padding: new EdgeInsets.only(left: 3.0, right: 3.0),
              child: new Stack(
                children: <Widget>[
                  new Container(
                    width: 150.0,
                    height: 150.0,
                    decoration: new BoxDecoration(
                        color: Colors.grey.withAlpha(100),
                        borderRadius: new BorderRadius.all(
                            new Radius.circular(15.0)),
                        image: new DecorationImage(
                            fit: BoxFit.cover,
                            image: new FileImage(imageList[index]))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: new CircleAvatar(
                      backgroundColor: Colors.red[600],
                      child: new IconButton(
                          icon: new Icon(
                            Icons.clear,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            removeNewImage(index);
                          }),
                    ),
                  )
                ],
              ),
            );
          }),
    ),
  );
}

Widget buildImages({int index, Map imagesMap}) {
  return imagesMap.isEmpty
      ? new Container(
    width: 150.0,
    height: 150.0,
    child: Stack(
      alignment: Alignment.center,
      children: <Widget>[
        new Icon(
          Icons.image,
          size: 100.0,
          color: Colors.white,
        ),
        new Icon(
          Icons.add_circle,
          color: Colors.grey,
        ),
      ],
    ),
    decoration: new BoxDecoration(
      color: Colors.grey.withAlpha(100),
    ),
  )
      : imagesMap[index] != null
      ? new Container(
    width: 150.0,
    height: 150.0,
    decoration: new BoxDecoration(
        color: Colors.grey.withAlpha(100),
        image: new DecorationImage(
            fit: BoxFit.cover,
            image: new FileImage(imagesMap[index]))),
  )
      : new Container(
    width: 150.0,
    height: 150.0,
    child: Stack(
      alignment: Alignment.center,
      children: <Widget>[
        new Icon(
          Icons.image,
          size: 100.0,
          color: Colors.white,
        ),
        new Icon(
          Icons.add_circle,
          color: Colors.grey,
        ),
      ],
    ),
    decoration: new BoxDecoration(
      color: Colors.grey.withAlpha(100),
    ),
  );
}

showSnackBar(String message, final scaffoldKey) {
  scaffoldKey.currentState.showSnackBar(new SnackBar(
    content: Text(
      message,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.white,
      ),
    ),
    backgroundColor: Colors.red,
  ));
}

displayProggressDialog(BuildContext context) {
  Navigator.of(context).push(new PageRouteBuilder(
      opaque: false,
      pageBuilder: (BuildContext context, _, __) {
        return new ProgressDialog();
      }));
}

closeProggressDialog(BuildContext context) {
  Navigator.of(context).pop();
}

writeBoolDataLocally({String key, bool value}) async {
  Future<SharedPreferences> saveLocal = SharedPreferences.getInstance();
  final SharedPreferences localData = await saveLocal;

  localData.setBool(key, value);
}

writeDataLocally({String key, String value}) async {
  Future<SharedPreferences> saveLocal = SharedPreferences.getInstance();
  final SharedPreferences localData = await saveLocal;

  localData.setString(key, value);
}

getDataLocally({String key}) async {
  Future<SharedPreferences> saveLocal = SharedPreferences.getInstance();
  final SharedPreferences localData = await saveLocal;

  return localData.get(key) == null ? '' : localData.get(key);
}

getStringDataLocally({String key}) async {
  Future<SharedPreferences> saveLocal = SharedPreferences.getInstance();
  final SharedPreferences localData = await saveLocal;

  return localData.getString(key);
}

getBoolDataLocally({String key}) async {
  Future<SharedPreferences> saveLocal = SharedPreferences.getInstance();
  final SharedPreferences localData = await saveLocal;

  return localData.getBool(key) == null ? false : localData.getBool(key);
}

clearDataLocally() async {
  Future<SharedPreferences> saveLocal = SharedPreferences.getInstance();
  final SharedPreferences localData = await saveLocal;
  localData.clear();
}
