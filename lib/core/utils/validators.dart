import '../localization/localization_manager.dart';

class Validators {
  Validators();

  String? required(String? value, {required String title}) {
    if (value == null || value.isEmpty) {
      return lz.mustEnter(title.toLowerCase());
    }
    return null;
  }

  String? phone(String? value, {required String title}) {
    if (value == null || value.isEmpty) {
      return required(value, title: title);
    }
    final phoneRegExp = RegExp(
        r'\+(9[976]\d|8[987530]\d|6[987]\d|5[90]\d|42\d|3[875]\d|2[98654321]\d|9[8543210]|8[6421]|6[6543210]|5[87654321]|4[987654310]|3[9643210]|2[70]|7|1)\d{1,14}$');
    if (!phoneRegExp.hasMatch(value)) {
      return lz.invalidPhoneNumber;
    }
    return null;
  }

  String? saudiMobile(String? value) {
    if (value == null || value.isEmpty) {
      return required(value, title: lz.mobileNumber);
    }

    // Remove any non-digit characters except '+'
    String cleanValue = value.replaceAll(RegExp(r'[^\d+]'), '');

    // Check if it starts with 05 and has 10 digits
    if (cleanValue.startsWith('05') && cleanValue.length == 10) {
      return null;
    }

    // Check if it starts with +9665 and has 13 digits
    if (cleanValue.startsWith('+9665') && cleanValue.length == 13) {
      return null;
    }
    
     // Check if it starts with 9665 and has 12 digits (sometimes + is omitted)
    if (cleanValue.startsWith('9665') && cleanValue.length == 12) {
      return null;
    }

    return lz.invalidPhoneNumber;
  }

  String? password(String? value) {
    if (value == null || value.isEmpty) {
      return required(value, title: lz.password);
    }
    return null;
  }

  String? identityNumber(String? value) {
    if (value == null || value.isEmpty) {
      return required(value, title: lz.nationalId);
    }
    if (value.length < 7) {
      return lz.identityNumberValidation;
    }
    return null;
  }

  String? email(String? value, {bool required = true}) {
    if (required && (value ?? '').isEmpty) {
      return this.required(value, title: lz.email);
    }

    if (!required && (value ?? '').isEmpty) {
      return null;
    }

    final bool emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(value ?? '');
    if (!emailValid) {
      return lz.invalidEmail;
    }

    return null;
  }

  String? otp(String? value) {
    if (value == null || value.length < 4) return lz.otpValidation;
    return null;
  }

    String? passwordConfirmation(String? password, String? passwordConfirmation) {
    if (password == null || password.isEmpty) {
      return lz.passwordRequired;
    }
    if (password != passwordConfirmation) {
      return lz.passwordsDoNotMatch;
    }
    return null;
  }

}
