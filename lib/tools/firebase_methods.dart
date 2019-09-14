import 'dart:async';
import 'app_methods.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'app_data.dart';
import 'app_tools.dart';
import 'package:flutter/services.dart';
import 'dart:io';

class FireBaseMethods implements AppMethods {
  Firestore fireStore = Firestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Future<String> createUserAccount(
      {String fullName, String phone, String email, String password}) async {
    // TODO: implement createUserAccount
    FirebaseUser user;

    try {
      user = await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      if (user != null) {
        await fireStore.collection(usersData).document(user.uid).setData({
          userID: user.uid,
          userFullName: fullName,
          emailAddres: email,
          phoneNumber: phone,
          userPassword: password,
        });

        writeDataLocally(key: userID, value: user.uid);
        writeDataLocally(key: userFullName, value: fullName);
        writeDataLocally(key: phoneNumber, value: phone);
        writeDataLocally(key: emailAddres, value: email);
        writeDataLocally(key: userPassword, value: password);
      }
    } on PlatformException catch (e) {
      // print(e.details);
      return ("Bilinmeyen bir hata oluştu,\n internetinizi kontrol edip tekrar deneyiniz");
    }

    return user == null
        ? errorMSG(
            "Bilinmeyen bir hata oluştu,\n internetinizi kontrol edip tekrar deneyiniz")
        : succesfullMSG();
  }

  @override
  Future<String> logginUser({String email, String password}) async {
    // TODO: implement logginUser
    FirebaseUser user;

    try {
      user = await auth.signInWithEmailAndPassword(
          email: email, password: password);

      if (user != null) {
        DocumentSnapshot userInfo = await getUserInfo(user.uid);
        await writeDataLocally(key: userID, value: userInfo[userID]);
        await writeDataLocally(
            key: userFullName, value: userInfo[userFullName]);
        await writeDataLocally(key: emailAddres, value: userInfo[emailAddres]);
        await writeDataLocally(key: phoneNumber, value: userInfo[phoneNumber]);
        await writeDataLocally(key: photoURL, value: userInfo[photoURL]);
        await writeBoolDataLocally(key: loggedIn, value: true);
      }
    } on PlatformException catch (e) {
      // print(e.details);
      if (e.message == "The email address is badly formatted.") {
        return errorMSG(
            "E-mail adresi geçerli değil\nLütfen kontrol ediniz.\n" +
                e.message);
      } else if (e.message ==
          "There is no user record corresponding to this identifier. The user may have been deleted.") {
        return errorMSG(
            " Böyle bir kullanıcı bulunmamaktadır.\nLütfen Kaydolunuz.\n" +
                e.message);
      } else {
        return ("Bilinmeyen bir hata oluştu,\n internetinizi kontrol edip tekrar deneyiniz");
      }
    }

    return user == null
        ? errorMSG(
            "Bilinmeyen bir hata oluştu,\n internetinizi kontrol edip tekrar deneyiniz")
        : succesfullMSG();
  }

  Future<bool> complete() async {
    return true;
  }

  Future<bool> notComplete() async {
    return false;
  }

  Future<String> errorMSG(String e) async {
    return e;
  }

  Future<String> succesfullMSG() async {
    return successful;
  }

  @override
  Future<bool> logOutUser() async {
    // TODO: implement logOutUser
    await auth.signOut();
    await clearDataLocally();
    return complete();
  }

  @override
  Future<DocumentSnapshot> getUserInfo(String userid) async {
    // TODO: implement getUserInfo
    return await fireStore.collection(usersData).document(userid).get();
  }
}
