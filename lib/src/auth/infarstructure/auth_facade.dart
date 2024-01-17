import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:restaurantmanagement/src/auth/domain/interfaces/i_auth_facade.dart';
import 'package:restaurantmanagement/src/auth/domain/user_model.dart';
import 'package:uuid/uuid.dart';

// ignore_for_file: no_leading_underscores_for_local_identifiers

class AuthFacade implements IAuthFacade {
  @override
  Future<User?> getSignedInUser() async {
    return FirebaseAuth.instance.currentUser;
  }

  @override
  Future<bool> signInWithGoogle() async {
    try {
      final googleUser = await GoogleSignIn().signIn();
      final googleAuth = await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      FirebaseAuth.instance.authStateChanges();
      var userResult =
          await FirebaseAuth.instance.signInWithCredential(credential);
      if (userResult.user != null) {
        final _user = UserModel(
          id: const Uuid().v4(),
          uid: userResult.user!.uid,
          displayName: userResult.user!.displayName ?? "",
          email: userResult.user!.email ?? "",
          photoURL: userResult.user!.photoURL ?? "",
        );
        var db = FirebaseFirestore.instance;

        await db.collection("users").doc(_user.uid).get().then(
          (value) {
            if (value.exists) {
              log("User already exists in DB");
            } else {
              db.collection("users").doc(_user.uid).set(_user.toMap());
              log("UserData Stored : ${_user.toMap()}");
            }
          },
        );

        return true;
      }
      return false;
    } catch (e) {
      log("Error signing in with Google: $e");
      throw const SocketException("Not working");
    }
  }

  @override
  Future<void> signOut() => Future.wait([
        GoogleSignIn().signOut(),
        FirebaseAuth.instance.signOut(),
      ]);

  // UserModel getCurrentUser() {
  //   final User? user = FirebaseAuth.instance.currentUser;

  //   if (user != null) {
  //     return UserModel(
  //       uid: user.uid,
  //       displayName: user.displayName ?? "",
  //       email: user.email ?? "",
  //       photoURL: user.photoURL ?? "",
  //     );
  //   } else {
  //     throw Exception("No user signed in.");
  //   }
  // }
}
