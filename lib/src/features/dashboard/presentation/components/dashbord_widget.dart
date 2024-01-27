import 'package:flutter/material.dart';

import '../../../../constants/utils/app_font_style.dart';
import '../../../../constants/utils/app_spacing.dart';
import '../../../restaurants/domain/entities/restaurant_model.dart';

class DashboardWidget extends StatelessWidget {
  RestaurantsModel data;

  DashboardWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  image: DecorationImage(
                    image: NetworkImage(data.image),
                  ),
                ),
              ),
              horizontalSpacing12,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.name,
                    style: KFontStyle.h2Style.copyWith(
                      debugLabel: "Restaurant Name",
                    ),
                  ),
                  Text(
                    data.admin,
                    style: KFontStyle.h2Style.copyWith(
                      debugLabel: "Restaurant Name",
                    ),
                  ),
                ],
              ),
            ],
          ),
          verticalSpacing12,
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text(
                "Stats",
                style: KFontStyle.h3Style.copyWith(color: Colors.black),
              ),
            ),
          )
        ],
      ),
    );
  }
}
