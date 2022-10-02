import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FirebaseAuthentication {
  final FirebaseAuth _firebaseAuth;

  FirebaseAuthentication(this._firebaseAuth);

  Stream checkUserAuthState() {
    return _firebaseAuth.userChanges();
  }
}

final authenticationProvider = Provider(((ref) {
  return FirebaseAuthentication(FirebaseAuth.instance);
}));

final userAutheProvider = StreamProvider(((ref) {
  return ref.watch(authenticationProvider).checkUserAuthState();
}));
