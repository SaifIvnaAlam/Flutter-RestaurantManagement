import 'package:flutter/material.dart';
import 'package:restaurantmanagement/app_config.dart';
import 'package:restaurantmanagement/src/core/bootstap.dart';

Future<void> main() async {
  await BootStrap().init();
  runApp(
    AppConfig().flavour(),
  );
}
