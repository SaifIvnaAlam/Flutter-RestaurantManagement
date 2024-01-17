import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:restaurantmanagement/src/constants/utils/app_spacing.dart';

class CreateResturantPage extends StatelessWidget {
  const CreateResturantPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const TextField(
                decoration: InputDecoration(
                  hintText: "Name of the Resturant",
                ),
              ),
              TextButton(
                onPressed: () {
                  log("PickImage Pressed");
                },
                child: const Text("PickImage"),
              ),
              verticalSpacing124,
              MaterialButton(
                color: Colors.blue[50],
                onPressed: () {},
                child: const Text("Create Resturant"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
