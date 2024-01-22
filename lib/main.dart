import 'package:flutter/material.dart';
import 'package:restaurantmanagement/src/core/app.dart';
import 'package:restaurantmanagement/src/core/bootstap.dart';
import 'package:restaurantmanagement/tests/app_tests/test_app.dart';

bool isTesting = false;
Future<void> main() async {
  await BootStrap().init();
  runApp(
    isTesting ? const TestApp() : const App(),
  );
}
