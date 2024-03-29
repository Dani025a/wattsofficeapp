class UserModel {
  final String uid;
  final String firstName;
  final String lastName;
  final String email;
  final String initials;
  final bool permanentWhereAreYou;
  final int permanentSeatNumber;
  final bool notificationOff;
  final bool notificationFridayMorning;
  final bool notificationThursdayEvening;
  final String? token;

  const UserModel(
      {required this.uid,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.initials,
      required this.permanentWhereAreYou,
      required this.permanentSeatNumber,
      required this.notificationOff,
      required this.notificationFridayMorning,
      required this.notificationThursdayEvening,
      required this.token});

  static UserModel fromJson(Map<String, dynamic> json) => UserModel(
      uid: json['uid'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      initials: json['initials'],
      permanentWhereAreYou: json['permanentWhereAreYou'],
      permanentSeatNumber: json['permanentSeatNumber'],
      notificationOff: json['notificationOff'],
      notificationFridayMorning: json['notificationFridayMorning'],
      notificationThursdayEvening: json['notificationThursdayEvening'],
      token: json['token']);

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'initials': initials,
        'permanentWhereAreYou': permanentWhereAreYou,
        'permanentSeatNumber': permanentSeatNumber,
        'notificationOff': notificationOff,
        'notificationFridayMorning': notificationFridayMorning,
        'notificationThursdayEvening': notificationThursdayEvening,
        'token': token
      };
}
