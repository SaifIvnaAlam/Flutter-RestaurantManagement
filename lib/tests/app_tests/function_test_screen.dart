import 'package:flutter/material.dart';
import 'package:restaurantmanagement/src/constants/firebase_helpers/firestore_helper_functions.dart';
import 'package:restaurantmanagement/src/core/show_error.dart';
// ignore_for_file: no_leading_underscores_for_local_identifiers

class FunctionTestsScreen extends StatelessWidget {
  const FunctionTestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _helperFunction = FirebaseHelperFunctions();
    return Scaffold(
      body: Center(
        child: MaterialButton(
          onPressed: () async {
            // Klog.unknowError();
            // Klog.fatalError("Test File", "Material Button OnPressed",
            //     " This is a test Message");
            // Klog.logMessage("This is a test Message");
            // Klog.logMap(ShowError(title: "error", statusCode: 404).toMap());
            var user = await _helperFunction.getCurrenUser();
            Klog.logMessage(user.email);
            Klog.logMessage(user.uid);
          },
          child: const Text("TestFunction"),
        ),
      ),
    );
  }
}
