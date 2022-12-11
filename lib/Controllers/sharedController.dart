import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wattsofficeapp/models/dateModel.dart';
import 'package:wattsofficeapp/models/seatingAndFoodPlanModel.dart';
import 'package:wattsofficeapp/views/Wigdets/updateSeatPopUp.dart';
import 'dart:async';

import '../utils/dialog.dart';

class SharedController {
  static Stream<List<DateModel>> getDates() => FirebaseFirestore.instance
      .collection('seatingAndMealPlan')
      .orderBy('date', descending: true)
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => DateModel.fromJson(doc.data())).toList());

  static Stream<List<SeatingAndFoodPlanModel>> getData(String id) =>
      FirebaseFirestore.instance
          .collection('seatingAndMealPlan/$id/seatsAndMealPlans')
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
}
