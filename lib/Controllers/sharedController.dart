import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:uuid/uuid.dart';
import 'package:wattsofficeapp/models/dateModel.dart';
import 'package:wattsofficeapp/models/seatingAndFoodPlanModel.dart';
import 'package:wattsofficeapp/models/userModel.dart';
import 'package:wattsofficeapp/views/Wigdets/updateSeatPopUp.dart';
import 'dart:async';

class SharedController {
  static Stream<List<DateModel>> getDates() => FirebaseFirestore.instance
      .collection('seatingAndMealPlan')
      .orderBy('date', descending: true)
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => DateModel.fromJson(doc.data())).toList());

  static Stream<List<UserModel>> getUsers() => FirebaseFirestore.instance
      .collection('users')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => UserModel.fromJson(doc.data())).toList());

  static Stream<List<SeatingAndFoodPlanModel>> getData(String id) =>
      FirebaseFirestore.instance
          .collection('seatingAndMealPlan/$id/seatsAndMealPlans')
          .orderBy('whereAreYou', descending: false)
          .snapshots()
          .map((snapshot) => snapshot.docs
              .map((doc) => SeatingAndFoodPlanModel.fromJson(doc.data()))
              .toList());

  static Stream<List<SeatingAndFoodPlanModel>> getUserData(
          String date, String uid) =>
      FirebaseFirestore.instance
          .collection('seatingAndMealPlan/$date/seatsAndMealPlans/$uid')
          .snapshots()
          .map((snapshot) => snapshot.docs
              .map((doc) => SeatingAndFoodPlanModel.fromJson(doc.data()))
              .toList());

  void addSeat(id, seatnumber) async {
    await FirebaseFirestore.instance
        .collection('seatingAndMealPlan/$id/seatsAndMealPlans')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({'seatNumber': seatnumber, 'whereAreYou': 0});
  }

  void addPermanentSeat(seatnumber) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update(
            {'permanentSeatNumber': seatnumber, 'permanentWhereAreYou': true});
  }

  void changeNotification(notificationOff, notificationFridayMorning,
      notificationThursdayEvening) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({
      'notificationOff': notificationOff,
      'notificationFridayMorning': notificationFridayMorning,
      'notificationThursdayEvening': notificationThursdayEvening
    });
  }

  void removeSeat(id) async {
    await FirebaseFirestore.instance
        .collection('seatingAndMealPlan/$id/seatsAndMealPlans')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({
      'seatNumber': 0,
    });
  }

  void removePermanentSeat() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({
      'permanentSeatNumber': 0,
    });
  }

  void removeAlwaysAtOffice() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({'permanentSeatNumber': 0, 'permanentWhereAreYou': false});
  }

  void alwaysAtOffice() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({'permanentWhereAreYou': true});
  }

  void addLocation(id, whereAreYou, bool fromWhere) async {
    if (fromWhere == true) {
      await FirebaseFirestore.instance
          .collection('seatingAndMealPlan/$id/seatsAndMealPlans')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({'whereAreYou': whereAreYou, 'seatNumber': 0});
    } else {
      await FirebaseFirestore.instance
          .collection('seatingAndMealPlan/$id/seatsAndMealPlans')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({'whereAreYou': whereAreYou});
    }
  }

  void addGuests(id, newguests, oldguest, numberOfMeals) async {
    int guests = numberOfMeals + (newguests - oldguest);
    await FirebaseFirestore.instance
        .collection('seatingAndMealPlan/$id/seatsAndMealPlans')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({'guests': newguests});

    await FirebaseFirestore.instance
        .collection('seatingAndMealPlan')
        .doc(id)
        .update({'numberOdMeals': guests});
  }
}
