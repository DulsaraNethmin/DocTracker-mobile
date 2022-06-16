import 'package:flutter/cupertino.dart';

class EmailValid {
  // bEmailValid(String email);

  bool isValidEmail(String email) {
    String regex = "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]";
    if (RegExp(regex).hasMatch(email))
      return true;
    else
      return false;
  }
}
