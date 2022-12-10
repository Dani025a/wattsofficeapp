
class UserModel {
  final String uid;
  final String firsName;
  final String lastName;
  final String email;
  final String initials;

  const UserModel(
      {required this.uid,
      required this.firsName,
      required this.lastName,
      required this.email,
      required this.initials});

  static UserModel fromJson(Map<String, dynamic> json) => UserModel(
        uid: json['uid'],
        firsName: json['firsName'],
        lastName: json['lastName'],
        email: json['email'],
        initials: json['initials'],
      );

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'firsName': firsName,
        'lastName': lastName,
        'email': email,
        'initials': initials,
      };
}
