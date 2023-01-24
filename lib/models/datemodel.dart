import 'package:wattsofficeapp/utils/utils.dart';

class DateModel {
  final DateTime date;
  final int seatsTaken;
  final int numberofMeals;

  const DateModel(
      {required this.date,
      required this.seatsTaken,
      required this.numberofMeals});

  static DateModel fromJson(Map<String, dynamic> json) => DateModel(
      date: Utils.toDateTime(json['date'])!,
      seatsTaken: json['seatsTaken'],
      numberofMeals: json['numberofMeals']);

  factory DateModel.fromJsonTwo(Map<String, dynamic> json) {
    return DateModel(
      date: json['date'],
      seatsTaken: json['seatsTaken'],
      numberofMeals: json['numberofMeals'],
    );
  }

  Map<String, dynamic> toJson() =>
      {'date': date, 'seatsTaken': seatsTaken, 'numberofMeals': numberofMeals};
}
