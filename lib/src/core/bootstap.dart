import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class BootStrap {
  Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }
}
