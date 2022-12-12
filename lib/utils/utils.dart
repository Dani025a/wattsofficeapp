import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wattsofficeapp/models/seatingAndFoodPlanModel.dart';

import '../models/dateModel.dart';

class Utils {
  static final DateFormat dateFormat = DateFormat("dd-MM-yyyy");
  static final DateFormat dayFormat = DateFormat("EEEE");

  static DateTime? toDateTime(Timestamp value) {
    if (value == null) return null;

    return value.toDate();
  }

  static dynamic fromDateTimeToJson(DateTime date) {
    if (date == null) return null;

    return date.toUtc();
  }

  getIndexForSeat(final List<SeatingAndFoodPlanModel> data, int seatNumber) {
    int? indexNumber;
    {
      for (int i = 0; i < data.length; i++) {
        if (data[i].seatNumber == null) {
        } else {
          if (seatNumber == data[i].seatNumber) {
            indexNumber = i;
          }
        }
      }
      if (indexNumber == null) {
        return null;
      } else {
        return indexNumber;
      }
    }
  }

  int weekNumber(DateTime date, bool seatingAndFoodScreen) {
    if (seatingAndFoodScreen == true) {
      date =
          DateTime(date.year, date.month, date.day - ((date.weekday % 7) - 1));
    }

    int dayOfYear = int.parse(DateFormat("D").format(date));
    return ((dayOfYear - date.weekday + 10) / 7).floor();
  }

  getUserInfo(final List<SeatingAndFoodPlanModel> data) {
    int? userIndex;
    String uid = FirebaseAuth.instance.currentUser!.uid;
    {
      for (int i = 0; i < data.length; i++) {
        if (uid == data[i].uid) {
          userIndex = i;
        }
      }
      if (userIndex == null) {
        return null;
      } else {
        return userIndex;
      }
    }
  }

  getCurrentDate(final List<DateModel> dateModel, var currentime,
      bool seatingAndFoodScreen) {
    int displayCurrentTime = 0;
    var now = DateTime.now();

    {
      if (seatingAndFoodScreen == true) {
        currentime =
            DateTime(now.year, now.month, now.day - ((now.weekday % 7) - 1));
      } else {
        if (currentime.weekday == DateTime.saturday) {
          currentime = DateTime(now.year, now.month, (now.day + 2));
        } else if (currentime.weekday == DateTime.sunday) {
          currentime = DateTime(now.year, now.month, (now.day + 1));
        }
      }

      for (int i = 0; i < dateModel.length; i++) {
        if (dateFormat.format(currentime) ==
            dateFormat.format(dateModel[i].date!)) {
          displayCurrentTime = i;
        }
      }
      return displayCurrentTime;
    }
  }
}
