import 'package:firebase_core/firebase_core.dart';

class BootStrap {
  Future<void> init() async {
    await Firebase.initializeApp();
  }
}
