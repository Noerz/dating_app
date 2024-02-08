import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dating_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class AuthController extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Rx<User?> currentUser = Rx<User?>(null);

  @override
  void onInit() {
    super.onInit();
    _listenToAuthChanges();
  }

  void _listenToAuthChanges() {
    _auth.authStateChanges().listen((User? user) {
      currentUser.value = user;
    });
  }

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      // Do something with the userCredential if needed
    } catch (e) {
      print('Sign-in with Google failed: $e');
    }
  }

  Future<void> signInWithFacebook() async {
    try {
      // Meminta izin dari pengguna untuk mengakses profil Facebook mereka
      final LoginResult loginResult = await FacebookAuth.instance.login();
      print("isi dari loginResult${loginResult}");
      // Mengecek apakah pengguna telah memberikan izin
      if (loginResult.status == LoginStatus.success) {
        final AccessToken accessToken = loginResult.accessToken!;
        final OAuthCredential credential =
            FacebookAuthProvider.credential(accessToken.token);

        final UserCredential userCredential =
            await _auth.signInWithCredential(credential);

        // Do something with the userCredential if needed
      } else {
        print('Sign-in with Facebook failed: ${loginResult.message}');
      }
    } catch (e) {
      print('Sign-in with Facebook failed: $e');
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
      await _googleSignIn.signOut();
      await FacebookAuth.instance.logOut(); // Logout dari akun Facebook
      currentUser.value = null;
    } catch (e) {
      print('Sign out failed: $e');
    }
  }
}
