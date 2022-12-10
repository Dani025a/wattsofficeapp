
class SeatingAndFoodPlanModel {
  final String? uid;
  final String? firstName;
  final String? lastName;
  final int? seatNumber;
  final String? initials;
  final int? guests;
  final int? whereAreYou;

  const SeatingAndFoodPlanModel({
    this.uid,
    this.firstName,
    this.lastName,
    this.seatNumber,
    this.initials,
    this.guests,
    this.whereAreYou,
  });

  static SeatingAndFoodPlanModel fromJson(Map<String, dynamic> json) =>
      SeatingAndFoodPlanModel(
        uid: json['uid'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        seatNumber: json['seatNumber'],
        initials: json['initials'],
        guests: json['guests'],
        whereAreYou: json['whereAreYou'],
      );

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'firstName': firstName,
        'lastName': lastName,
        'seatNumber': seatNumber,
        'initials': initials,
        'guests': guests,
        'whereAreYou': whereAreYou,
      };
}
