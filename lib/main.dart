import 'package:flutter/material.dart';
import 'package:restaurantmanagement/src/app/app.dart';
import 'package:restaurantmanagement/src/app/bootstap.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await BootStrap().init();
  runApp(App());
}
