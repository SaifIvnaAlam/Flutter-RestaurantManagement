import 'package:flutter/material.dart';
import 'package:restaurantmanagement/tests/app_tests/function_test_screen.dart';

class TestApp extends StatelessWidget {
  const TestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FunctionTestsScreen(),
    );
  }
}
