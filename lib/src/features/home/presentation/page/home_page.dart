import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurantmanagement/src/constants/utils/app_colors.dart';
import 'package:restaurantmanagement/src/features/home/presentation/components/home_page_containers.dart';
import 'package:restaurantmanagement/src/routes/go_router_constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.lightOrange,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HomepageContainer(
                name: 'Create Resturant',
                ontap: () {
                  context.push(NamedRoute.CREATE_RESTURANT);
                }),
            HomepageContainer(
                name: 'DashBoard',
                ontap: () {
                  context.push(NamedRoute.DASHBOARD_PAGE);
                }),
            HomepageContainer(
                name: 'Create Product',
                ontap: () {
                  context.push(NamedRoute.CREATE_ITEM_PAGE);
                }),
            HomepageContainer(
                name: 'Create Order',
                ontap: () {
                  context.push(NamedRoute.ORDER_PAGE);
                }),
          ],
        ),
      ),
    );
  }
}
