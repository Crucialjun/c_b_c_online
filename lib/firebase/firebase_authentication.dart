import 'package:c_b_c_online/features/dashboard/screens/main_dashboard.dart';
import 'package:c_b_c_online/global_utils/error_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthentication {
  final FirebaseAuth _firebaseAuth;

  FirebaseAuthentication(this._firebaseAuth);

  Stream checkUserAuthState() {
    return _firebaseAuth.userChanges();
  }

  Future signInWithFacebook(BuildContext context) async {
    try {
      print("facebook triggered");
      // Trigger the sign-in flow
      final LoginResult loginResult = await FacebookAuth.instance.login();

      // Create a credential from the access token
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);

      // Once signed in, return the UserCredential
      FirebaseAuth.instance
          .signInWithCredential(facebookAuthCredential)
          .then((value) {
        Navigator.pushNamedAndRemoveUntil(
            context, MainDashboard.routeName, ((route) => false));
      });
    } catch (e) {
      ErrorScreen(
        errorMsg: e.toString(),
      );
    }
  }

  Future signInWithGoogle(BuildContext context) async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance
          .signInWithCredential(credential)
          .then((value) {
        Navigator.pushNamedAndRemoveUntil(
            context, MainDashboard.routeName, ((route) => false));
      });
    } catch (e) {
      print(e.toString());
    }
  }
}

final authenticationProvider = Provider(((ref) {
  return FirebaseAuthentication(FirebaseAuth.instance);
}));

final userAutheProvider = StreamProvider(((ref) {
  return ref.watch(authenticationProvider).checkUserAuthState();
}));
