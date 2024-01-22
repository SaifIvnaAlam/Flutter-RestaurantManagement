import 'package:flutter/material.dart';
import '../../../../core/show_error.dart';
import '../../../../constants/utils/app_colors.dart';
import '../../../../constants/utils/app_spacing.dart';
import '../../../../constants/utils/app_font_style.dart';

class NotOwnerWidget extends StatelessWidget {
  const NotOwnerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Center(
          child: Text("Let's Create a Restaurant"),
        ),
        const TextField(
          decoration: InputDecoration(
            hintText: 'Restaurant Name',
          ),
        ),
        verticalSpacing12,
        Container(
          decoration: BoxDecoration(
            color: AppColors.brown,
            borderRadius: BorderRadius.circular(10),
          ),
          child: MaterialButton(
            onPressed: () {
              Klog.logMessage("Select image is Pressed");
            },
            child: Text("Select You logo", style: KFontStyle.buttonBold),
          ),
        ),
        verticalSpacing124,
        Container(
          width: 400,
          decoration: BoxDecoration(
            color: AppColors.darkGrey,
            borderRadius: BorderRadius.circular(10),
          ),
          child: MaterialButton(
            onPressed: () {
              Klog.logMessage("Select image is Pressed");
            },
            child: Text(
              "Create Restaurant",
              style: KFontStyle.buttonBold,
            ),
          ),
        ),
      ],
    );
  }
}
