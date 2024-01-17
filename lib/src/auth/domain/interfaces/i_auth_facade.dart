import 'package:firebase_auth/firebase_auth.dart';

abstract class IAuthFacade {
  Future<User?> getSignedInUser();

  Future<bool> signInWithGoogle();

  Future<void> signOut();
}
