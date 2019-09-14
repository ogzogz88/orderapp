import 'package:flutter/material.dart';
import 'package:orderapp/tools/app_data.dart';
import 'package:orderapp/tools/app_methods.dart';
import 'package:orderapp/tools/app_tools.dart';
import 'package:orderapp/tools/firebase_methods.dart';
import 'package:orderapp/userScreens/signUp.dart';

class LoginLogout extends StatefulWidget {
  @override
  _LoginLogoutState createState() => _LoginLogoutState();
}

class _LoginLogoutState extends State<LoginLogout> {
  TextEditingController emailCont = new TextEditingController();
  TextEditingController passwordCont = new TextEditingController();
   final  scaffoldKey = new GlobalKey<ScaffoldState>();

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
        title: Text('Giriş Yap'),
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
            appButton(
              btnPadding: 90,
              btnTxt: "Giriş",
              btnColor: Theme.of(context).primaryColor,
              onBtnClicked: verifyLogin,
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    new MaterialPageRoute(builder: (MyContext) => SignUp()));
              },
              child: Text(
                "Kayıt olmak için tıkla!",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }

  verifyLogin() async {
    if (emailCont.text == "") {
      showSnackBar("e-mail adresi boş bırakılamaz!", scaffoldKey);
      return;
    }

    if (passwordCont.text == "") {
      showSnackBar("Parola boş bırakılamaz!", scaffoldKey);
      return;
    }

    displayProggressDialog(context);

    String response = await appMethod.logginUser(
        email: emailCont.text.toLowerCase(),
        password: passwordCont.text.toLowerCase());
    if (response == successful) {
      closeProggressDialog(context);
      showSnackBar("Giriş başarılı\n  " + response, scaffoldKey);
      Navigator.of(context).pop(true);
    } else {
      closeProggressDialog(context);
      showSnackBar(response, scaffoldKey);
    }
  }
}
