import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wattsofficeapp/models/dateModel.dart';
import 'package:wattsofficeapp/models/seatingAndFoodPlanModel.dart';
import 'dart:async';

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
}
