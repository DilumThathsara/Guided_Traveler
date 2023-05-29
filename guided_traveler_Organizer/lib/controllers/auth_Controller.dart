import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:guided_traveler/models/user_model.dart';
import 'package:guided_traveler/screens/auth/signUp.dart';
import 'package:guided_traveler/utils/alert_helper.dart';
import 'package:guided_traveler/utils/assets_Constants.dart';

import 'package:logger/logger.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthController {
  //--- signup user

  Future<void> signUpUser(
      String email, String password, String name, BuildContext context) async {
    try {
      //--creating the user in the firebase console
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      //---check if user obejct is not null
      if (credential.user != null) {
        //---save extra user data in firestore cloud
        saveUserData(credential.user!.uid, email, name);
      }

      Logger().i(credential);
    } on FirebaseAuthException catch (e) {
      Logger().e(e.code);
    } catch (e) {
      Logger().e(e);
    }
  }

  //---save the user data in cloud firestore
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  //--- Create a CollectionReference called users that references the firestore collection
  CollectionReference users =
      FirebaseFirestore.instance.collection('driverRegister');

  //----save extra user data in firestore
  Future<void> saveUserData(String uid, String email, String name) {
    return users
        .doc(uid)
        .set(
          {
            'uid': uid,
            'email': email,
            'name': name,
            'img': AssetConstants.dummyProfileImg,
          },
        )
        .then((value) => Logger().i("Successfully added"))
        .catchError((error) => Logger().e("Failed to merge data: $error"));
  }

  //---fetch userdata from cloudfirestore
  Future<UserModel?> fetchUserData(String uid) async {
    try {
      //---firebase query that find and fetch user data according to that uid
      DocumentSnapshot documentSnapshot = await users.doc(uid).get();

      Logger().i(documentSnapshot.data());

      //---mapping fetch user data into usermodel
      UserModel model =
          UserModel.fromJason(documentSnapshot.data() as Map<String, dynamic>);

      return model;
    } catch (e) {
      Logger().e(e);
      return null;
    }
  }

  //---login user
  static Future<void> loginUser(
      String email, String password, BuildContext context) async {
    try {
      //----start login in the user in the firebase console
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Logger().i(credential);
    } on FirebaseAuthException catch (e) {
      Logger().e(e.code);
      AlertHelper.showAlert(context, "Error", e.code, DialogType.error);
    } catch (e) {
      Logger().e(e);
      AlertHelper.showAlert(context, "Error", e.toString(), DialogType.error);
    }
  }

  //----reset password email
  static Future<void> sendResetPassEmail(
      String email, BuildContext context) async {
    try {
      //----start sending apassword reset email
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      Logger().e(e.code);
      AlertHelper.showAlert(context, "Error", e.code, DialogType.error);
    } catch (e) {
      Logger().e(e);
      AlertHelper.showAlert(context, "Error", e.toString(), DialogType.error);
    }
  }

  //--signOut user
  static Future<void> signOutUser() async {
    await FirebaseAuth.instance.signOut();
  }
}
