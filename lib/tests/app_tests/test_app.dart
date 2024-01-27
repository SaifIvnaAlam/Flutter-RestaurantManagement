import 'package:flutter/material.dart';
import 'package:restaurantmanagement/tests/app_tests/nav_bar_test.dart';
import 'package:restaurantmanagement/tests/app_tests/discord_nav_bar.dart';

class TestApp extends StatelessWidget {
  const TestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DiscordNavbar(),
    );
  }
}
