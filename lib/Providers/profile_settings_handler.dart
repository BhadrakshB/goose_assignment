import 'dart:typed_data';

import 'package:flutter/material.dart';

class ProfileSettingsHandler extends ChangeNotifier {
  bool pushNotificationsSwitch = false;
  bool emailSubscriptionSwitch = false;
  Uint8List? profilePic;

  void changePush(bool value) {
    pushNotificationsSwitch = value;
    notifyListeners();
  }

  

  void changeSubscription(bool value) {
    emailSubscriptionSwitch = value;
    notifyListeners();
  }
}
