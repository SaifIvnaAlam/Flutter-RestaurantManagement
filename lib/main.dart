import 'package:flutter/material.dart';
import 'package:restaurantmanagement/src/core/app.dart';
import 'package:restaurantmanagement/src/core/bootstap.dart';

Future<void> main() async {
  await BootStrap().init();
  runApp(App());
}
