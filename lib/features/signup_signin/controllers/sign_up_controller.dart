import 'package:c_b_c_online/firebase/firebase_authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignupController {
  Future loginWithFacebook(BuildContext context) async {
    await FirebaseAuthentication(FirebaseAuth.instance)
        .signInWithFacebook(context);
  }

  Future loginWithGoogle(BuildContext context) async {
    await FirebaseAuthentication(FirebaseAuth.instance)
        .signInWithGoogle(context);
  }
}

final signupControllerProvider = Provider(((ref) {
  return SignupController();
}));
