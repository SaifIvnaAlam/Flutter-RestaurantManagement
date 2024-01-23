import 'package:flutter/material.dart';
import 'package:restaurantmanagement/src/core/show_error.dart';

import 'src/core/app.dart';
import 'tests/app_tests/test_app.dart';

// ignore_for_file: prefer_final_fields

// ignore_for_file: unnecessary_cast

enum Flavor { TEST, DEV, PROD }

class AppConfig {
  AppConfig();

  var _isDev = Flavor.DEV;
  Widget flavour() {
    Klog.logMessage("Running $_isDev");
    if (_isDev == Flavor.TEST) {
      return const TestApp() as Widget;
    } else {
      return const App() as Widget;
    }
  }
}
