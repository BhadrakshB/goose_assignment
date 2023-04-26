import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationHandler extends ChangeNotifier {
  GoogleSignInAccount? userAccount;
  GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: [
      'email',
    ],
  );

  Future<bool> signInGoogle() async {
    log("Started Google Auth");
    try {
      final GoogleSignInAccount? account = await googleSignIn.signIn();

      if (account != null) {
        log(account.email);
        final GoogleSignInAuthentication auth = await account.authentication;
        final credential = GoogleAuthProvider.credential(
          accessToken: auth.accessToken,
          idToken: auth.idToken,
        );
        await FirebaseAuth.instance.signInWithCredential(credential);
        userAccount = account;
        return true;
      }
      googleSignIn.signOut();
      return false;
    } catch (error) {
      googleSignIn.signOut();
      log(error.toString());
      return false;
    }
  }

  void logout() async {
    
    var logs = await googleSignIn.signOut();
    log(logs.toString());
    userAccount = null;
  }
}
