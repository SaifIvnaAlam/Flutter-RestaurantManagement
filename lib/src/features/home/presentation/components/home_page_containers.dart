import 'package:flutter/material.dart';
// ignore_for_file: must_be_immutable

class HomepageContainer extends StatelessWidget {
  String name;
  VoidCallback ontap;
  HomepageContainer({super.key, required this.name, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GestureDetector(
        onTap: ontap,
        child: Container(
          width: 200,
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.red,
          ),
          child: Center(child: Text(name)),
        ),
      ),
    );
  }
}
