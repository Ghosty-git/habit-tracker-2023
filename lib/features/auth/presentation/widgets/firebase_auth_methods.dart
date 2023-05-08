import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../iternal/helpers/components/exceptions.dart';

class FirebaseAuthMethods {
  final FirebaseAuth _auth;

  FirebaseAuthMethods(this._auth);
  // EMAIL SIGN UP
  Future<void> signUpWithEmail({
    required String name,
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await sendEmailVerification(context);
    } on FirebaseAuthException catch (e) {
      Exceptions.showFlushbar(
        e.message.toString(),
        context: context,
      );
    }
  }

  // EMAIL SIGN IN
  Future<void> signInWithEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (!_auth.currentUser!.emailVerified) {
        await sendEmailVerification(context);
      }
    } on FirebaseAuthException catch (e) {
      Exceptions.showFlushbar(
        e.message.toString(),
        context: context,
      );
    }
  }

  // EMAIL VERIFICATION
  Future<void> sendEmailVerification(BuildContext context) async {
    try {
      _auth.currentUser!.sendEmailVerification();
      Exceptions.showFlushbar('Email verefication sent', context: context);
    } on FirebaseAuthException catch (e) {
      Exceptions.showFlushbar(
        e.message.toString(),
        context: context,
      );
    }
  }

  // RESET PASSWORD

  Future<void> resetPassword({
    required String email,
    required BuildContext context,
  }) async {
    SmartDialog.showLoading();
    try {
      await _auth.sendPasswordResetEmail(email: email);

      SmartDialog.dismiss();
      Exceptions.showFlushbar(
        'Password Reset sent',
        context: context,
      );
      // Navigator.of(context).push(MaterialPageRoute(
      //   builder: (context) => SignInScreen(),
      // ));
    } on FirebaseAuthException catch (e) {
      Exceptions.showFlushbar(e.message.toString(), context: context);
    }
  }
}

class GoogleSignInMethod {
  signInWithGoogle() async {
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
