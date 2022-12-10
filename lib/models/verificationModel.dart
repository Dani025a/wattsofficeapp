
class VerificationModel {
  final int? verificationCode;

  VerificationModel({required this.verificationCode});

  static VerificationModel fromJson(Map<String, dynamic> json) =>
      VerificationModel(verificationCode: json['verificationcode']);
}
