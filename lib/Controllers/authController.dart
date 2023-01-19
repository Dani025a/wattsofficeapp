// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wattsofficeapp/l10n/locale_keys.g.dart';
import 'package:wattsofficeapp/models/userModel.dart';
import 'package:wattsofficeapp/utils/authErrorMesages.dart';
import '../views/Screens/homeScreen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get/get.dart' hide Trans;
import '../views/Screens/signUpScreen.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> _user;
  bool isSignedIn = false;
  User? get user => _user.value;
  final FirebaseAuth auth = FirebaseAuth.instance;

  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.authStateChanges());
    ever(_user, loginRedirect);
  }

  loginRedirect(User? user) {
    Timer(Duration(seconds: isSignedIn ? 0 : 0), () {
      if (user == null) {
        isSignedIn = false;
        update();
        Get.offAll(() => SignUpScreen());
      } else {
        isSignedIn = true;
        update();
        Get.offAll(() => HomeScreen());
      }
    });
  }

  void signUp(
      email, password, firstName, lastName, verificationCode, initials) async {
    // Jeg får fat i verificationCode
    final dbverification = await FirebaseFirestore.instance
        .collection('verificationcode')
        .doc('verificationcode')
        .get();
    //får fat i den field jeg ønsker at have.
    String? firebaseVerificationCode = dbverification['verificationCode'];

    //Tjekker om input fra user er null eller empty
    if (email == null ||
        email == "" ||
        password == null ||
        password == "" ||
        firstName == null ||
        firstName == "" ||
        lastName == null ||
        lastName == "" ||
        verificationCode == null ||
        verificationCode == "" ||
        initials == null ||
        initials == "") {
      getErrorSnackBar(LocaleKeys.emptyFieldsError.tr());
    }
    // tjekker om verification fra firebase er den samme som input
    else if (firebaseVerificationCode != verificationCode) {
      getErrorSnackBar(LocaleKeys.wrongVerificationCode.tr());
    } else
      try {
        isSignedIn = true;
        update();
        await auth.createUserWithEmailAndPassword(
            email: email, password: password);
        await FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .set(UserModel(
                    uid: FirebaseAuth.instance.currentUser!.uid,
                    firstName: firstName,
                    lastName: lastName,
                    email: email,
                    initials: initials,
                    permanentWhereAreYou: false,
                    permanentSeatNumber: 0,
                    notificationOff: true,
                    notificationFridayMorning: false,
                    notificationThursdayEvening: false)
                .toJson());
        getSuccessSnackBar(
            "${LocaleKeys.signUpSuccesMessage.tr()} $firstName $lastName");
      } on FirebaseAuthException catch (e) {
        String errormessage = getMessageFromErrorCode(e.code);
        getErrorSnackBar(errormessage);
      }
  }

  void signIn(email, password) async {
    try {
      isSignedIn = true;
      update();
      await auth.signInWithEmailAndPassword(email: email, password: password);
      final userInfo = await FirebaseFirestore.instance
          .collection('users')
          .doc(auth.currentUser?.uid)
          .get();
      //får fat i den field jeg ønsker at have.
      String? firstName = userInfo['firsName'];
      String? lastName = userInfo['lastName'];
      getSuccessSnackBar(
          "${LocaleKeys.signUpSuccesMessage.tr()} $firstName $lastName");
    } on FirebaseAuthException catch (e) {
      String errormessage = getMessageFromErrorCode(e.code);
      getErrorSnackBar(errormessage);
    }
  }

  void addNewUser(email, password, firstName, lastName, verificationCode, initials){
  }

  getErrorSnackBar(String message) {
    Get.snackbar(
      LocaleKeys.snackBarError.tr(),
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      borderRadius: 10,
      margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
    );
  }

  getErrorSnackBarNew(String message) {
    Get.snackbar(
      LocaleKeys.snackBarError.tr(),
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      borderRadius: 10,
      margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
    );
  }

  getSuccessSnackBar(String message) {
    Get.snackbar(
      LocaleKeys.welcome.tr(),
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      borderRadius: 10,
      margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
    );
  }

  void signOut() async {
    await auth.signOut();
  }
}
