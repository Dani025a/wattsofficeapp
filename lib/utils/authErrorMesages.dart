import 'package:easy_localization/easy_localization.dart';
import 'package:wattsofficeapp/l10n/locale_keys.g.dart';

String getMessageFromErrorCode(String errorCode) {
  switch (errorCode) {
    case "ERROR_EMAIL_ALREADY_IN_USE":
    case "account-exists-with-different-credential":
    case "email-already-in-use":
      return LocaleKeys.emailErrorUsedEmail.tr();
    case "ERROR_WRONG_PASSWORD":
    case "wrong-password":
    case "ERROR_USER_NOT_FOUND":
    case "user-not-found":
      return LocaleKeys.authWrongEmailPasswordCombination.tr();

    case "ERROR_TOO_MANY_REQUESTS":
    case "operation-not-allowed":
      return LocaleKeys.authTooManyRequest.tr();

    case "ERROR_OPERATION_NOT_ALLOWED":
    case "operation-not-allowed":
      return LocaleKeys.authServerErrorMessage.tr();

    case "ERROR_INVALID_EMAIL":
    case "invalid-email":
      return LocaleKeys.authEmailAdressInvalid.tr();

    case "weak-password":
      return LocaleKeys.passwordErrorShort.tr();

    default:
      return "Login failed. Please try again.";
  }
}
