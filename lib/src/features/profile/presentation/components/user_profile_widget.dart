import 'package:flutter/material.dart';
import '../../../../auth/domain/user_model.dart';
// ignore_for_file: must_be_immutable

class Profile extends StatelessWidget {
  UserModel data;
  Profile({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(image: NetworkImage(data.photoURL)),
          ),
        ),
        Text(data.email),
      ],
    );
  }
}
