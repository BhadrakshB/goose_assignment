// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:developer';

import 'package:flutter/material.dart';

class NewUser {
  final String userName;
  final String emailAddress;
  final String password;

  NewUser(this.userName, this.emailAddress, this.password);
}

class SignUpHandler extends ChangeNotifier {
  String username = '';
  String email = '';
  String password = '';

  List<bool> progress = [false, false, false, false];

  void changeProgress() {}

  void setUsername(String _username) {
    username = _username;
    if (_username != '') {
      progress[0] = true;
    }
    notifyListeners();
    log(progress.toString());
  }

  void setEmail(String _email) {
    email = _email;
    if (_email != '') {
      progress[1] = true;
    }
    notifyListeners();
    log(progress.toString());
  }

  void setPassword(String _password) {
    password = _password;
    if (_password != '') {
      progress[2] = true;
    }
    notifyListeners();
    log(progress.toString());
  }

  void confirmPassword(String confirmPassword) {
    progress[3] = password == confirmPassword;
    notifyListeners();
    log(progress.toString());
  }

  void submit() {
    NewUser user = NewUser(username, email, password);
    // TODO: Complete submit function
  }
}
