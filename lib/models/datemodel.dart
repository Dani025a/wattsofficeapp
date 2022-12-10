import 'package:wattsofficeapp/utils/utils.dart';

class DateModel {
  final DateTime? date;
  final int? seatsTaken;
  final int? numberofMeals;

  const DateModel({this.date, this.seatsTaken, this.numberofMeals});

  static DateModel fromJson(Map<String, dynamic> json) => DateModel(
      date: Utils.toDateTime(json['date']),
      seatsTaken: json['seatsTaken'],
      numberofMeals: json['numberofMeals']);

  Map<String, dynamic> toJson() =>
      {'date': date, 'seatsTaken': seatsTaken, 'numberofMeals': numberofMeals};
}
