import 'package:flutter/cupertino.dart';

abstract class Validate {
  static void offKeyboard(BuildContext context) {
    final FocusScopeNode currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
      return;
    }
    currentFocus.unfocus();
  }

  static String isValidName(String value) {
    if (value.isEmpty) {
      return 'Name cannot be Empty';
    }
    return null;
  }

  static validatePassword(val) {
    if (val.isEmpty) {
      return 'Password cannot be empty!';
    } else if (val.length < 6) {
      return "Password must be up to 6 characters";
    } else {
      return null;
    }
  }

  static validateConfirmPassword(val, password) {
    if (val.isEmpty) {
      return 'Password cannot be empty!';
    } else if (val != password) {
      return "Password do not match";
    } else {
      return null;
    }
  }

  static isValidCard(val) {
    if (val.isEmpty) {
      return 'Card Number cannot be empty!';
    } else if (val.length < 16 || val.length > 16) {
      return "Card number require 16 valid digit";
    } else {
      return null;
    }
  }

  static isValidMonth(val) {
    if (val.isEmpty) {
      return 'Month cannot be empty!';
    } else if (val.length < 2 || val.length > 2) {
      return "Expire month require two valid digit";
    } else {
      return null;
    }
  }

  static isYear(val) {
    if (val.isEmpty) {
      return 'Year cannot be empty!';
    } else if (val.length < 2 || val.length > 2) {
      return "Expire month require two valid digit";
    } else {
      return null;
    }
  }

  static isCvv(val) {
    if (val.isEmpty) {
      return 'Cvv cannot be empty!';
    } else if (val.length < 3 || val.length > 3) {
      return "Expire month require three valid digit";
    } else {
      return null;
    }
  }

  static String validateEmail(value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Enter Valid Email';
    } else if (value.isEmpty) {
      return 'Please enter your email!';
    } else
      return null;
  }

  static String validateMobile(String value) {
    String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return 'Please enter mobile number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return null;
  }
}

extension customStringExtension on String {
  toTitleCase() {
    final words = this.toString().split(' ');
    var newWord = '';
    for (var word in words) {
      if (word.isNotEmpty)
        newWord += '${word[0].toUpperCase()}${word.substring(1)} ';
    }

    return newWord;
  }
}
