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
  textType == null ? textType= TextInputType.text : textType;

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

writeDataLocally({String key, String value}) async{
Future<SharedPreferences> saveLocal =SharedPreferences.getInstance();
final SharedPreferences localData = await saveLocal;

localData.setString(key, value);

}
