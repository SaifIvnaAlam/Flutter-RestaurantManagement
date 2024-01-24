import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  VoidCallback ontap;
  String title;
  Button({
    Key? key,
    required this.ontap,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(onPressed: ontap, child: Text(title));
  }
}
