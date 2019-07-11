import 'package:flutter/material.dart';
import 'package:orderapp/tools/app_data.dart';
import 'package:orderapp/tools/app_methods.dart';
import 'package:orderapp/tools/app_tools.dart';
import 'package:orderapp/tools/firebase_methods.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController nameCont = new TextEditingController();
  TextEditingController phoneCont = new TextEditingController();
  TextEditingController emailCont = new TextEditingController();
  TextEditingController passwordCont = new TextEditingController();
  TextEditingController rePasswordCont = new TextEditingController();

  final scaffoldKey = new GlobalKey<ScaffoldState>();
  BuildContext myContext;

  AppMethods appMethod = new FireBaseMethods();

  @override
  Widget build(BuildContext context) {
    this.myContext = context;

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.deepOrangeAccent,
      //Theme.of(context).primaryColor

      appBar: AppBar(
        title: Text('Kayıt Ol'),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            appTextField(
              isPassword: false,
              sidePadding: 18,
              textHint: "Ad Soyad",
              textIcon: Icon(Icons.person),
              mycontroller: nameCont,
            ),
            SizedBox(
              height: 10,
            ),
            appTextField(
              isPassword: false,
              sidePadding: 18,
              textHint: "Telefon Numarası",
              textIcon: Icon(Icons.phone),
              mycontroller: phoneCont,
              textType: TextInputType.number,
            ),
            SizedBox(
              height: 10,
            ),
            appTextField(
              isPassword: false,
              sidePadding: 18,
              textHint: "E-mail Adresi",
              textIcon: Icon(Icons.email),
              mycontroller: emailCont,
            ),
            SizedBox(
              height: 10,
            ),
            appTextField(
              isPassword: true,
              sidePadding: 18,
              textHint: "Parola",
              textIcon: Icon(Icons.lock),
              mycontroller: passwordCont,
            ),
            SizedBox(
              height: 10,
            ),
            appTextField(
              isPassword: true,
              sidePadding: 18,
              textHint: "Parolayı tekrarlayın",
              textIcon: Icon(Icons.lock),
              mycontroller: rePasswordCont,
            ),
            SizedBox(
              height: 10,
            ),
            appButton(
              btnPadding: 90,
              btnTxt: "Hesap Oluştur",
              btnColor: Theme.of(context).primaryColor,
              onBtnClicked: verifyDetails,
            ),
          ],
        ),
      ),
    );
  }

  verifyDetails() async {
    if (nameCont.text == "") {
      showSnackBar("Ad Soyad boş bırakılamaz!", scaffoldKey);
      return;
    }
    if (phoneCont.text == "") {
      showSnackBar("Telefon numarası boş bırakılamaz!", scaffoldKey);
      return;
    }
    if (emailCont.text == "") {
      showSnackBar("e-mail adresi boş bırakılamaz!", scaffoldKey);
      return;
    }

    if (passwordCont.text == "") {
      showSnackBar("Parola boş bırakılamaz!", scaffoldKey);
      return;
    }

    if (rePasswordCont.text == "") {
      showSnackBar("Parola tekrarı boş bırakılamaz!", scaffoldKey);
      return;
    }
    if (passwordCont.text != rePasswordCont.text) {
      showSnackBar("Parolalar uyuşmuyor!", scaffoldKey);
      return;
    }

    displayProggressDialog(context);

    String response = await appMethod.createUserAccount(
        fullName: nameCont.text,
        email: emailCont.text.toLowerCase(),
        phone: phoneCont.text,
        password: passwordCont.text.toLowerCase());
    if (response == successful) {
      closeProggressDialog(context);
     // showSnackBar("Kayıt başarılı\n  " + response, scaffoldKey);
      Navigator.of(context).pop();
      Navigator.of(context).pop();
    } else {
      closeProggressDialog(context);
      showSnackBar(response, scaffoldKey);
    }
  }
}
