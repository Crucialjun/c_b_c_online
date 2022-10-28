import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FirebaseAuthentication {
  final FirebaseAuth _firebaseAuth;

  FirebaseAuthentication(this._firebaseAuth);

  Stream checkUserAuthState() {
    return _firebaseAuth.userChanges();
  }

  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }
}

final authenticationProvider = Provider(((ref) {
  return FirebaseAuthentication(FirebaseAuth.instance);
}));

final userAutheProvider = StreamProvider(((ref) {
  return ref.watch(authenticationProvider).checkUserAuthState();
}));
