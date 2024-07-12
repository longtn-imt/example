import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

export 'package:firebase_auth/firebase_auth.dart' show User;

class FirebaseAuthentication {
  const FirebaseAuthentication._();
  static const instance = FirebaseAuthentication._();

  User? get currentUser => FirebaseAuth.instance.currentUser;

  Stream<User?> authStateChanges() => FirebaseAuth.instance.authStateChanges();

  Stream<User?> userChanges() => FirebaseAuth.instance.userChanges();

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await switch (kIsWeb) {
      true => GoogleSignIn().signInSilently(),
      false => GoogleSignIn().signIn(),
    };

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<UserCredential> signInWithFacebook() =>
      FirebaseAuth.instance.signInWithProvider(
        FacebookAuthProvider()
          ..addScope('user_birthday')
          ..setCustomParameters({'display': 'popup'}),
      );

  Future<UserCredential> signInWithApple() =>
      FirebaseAuth.instance.signInWithProvider(
        AppleAuthProvider()
          ..addScope('email')
          ..setCustomParameters({'locale': 'vi'}),
      );

  Future<void> signOut() => FirebaseAuth.instance.signOut();
}
