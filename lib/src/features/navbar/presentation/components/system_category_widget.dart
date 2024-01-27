import 'package:flutter/material.dart';

import '../../../../constants/utils/app_font_style.dart';

class SystemCategoryWidget extends StatelessWidget {
  VoidCallback onTap;
  String title;
  SystemCategoryWidget({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: MaterialButton(
          onPressed: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: Text(
                  title,
                  style: KFontStyle.buttonBold.copyWith(
                      color: Colors.black,
                      letterSpacing: 1,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Icon(Icons.arrow_forward_ios)
            ],
          ),
        ),
      ),
    );
  }
}
