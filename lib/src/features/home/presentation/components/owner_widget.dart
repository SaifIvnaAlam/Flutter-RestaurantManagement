import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurantmanagement/src/features/home/presentation/components/home_page_containers.dart';

import '../../../../routes/go_router_constants.dart';

class RestaurantOwnerWidget extends StatelessWidget {
  const RestaurantOwnerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          HomepageContainer(
              name: 'DashBoard',
              ontap: () {
                context.push(NamedRoute.DASHBOARD_PAGE);
              }),
          HomepageContainer(
              name: 'Create Product',
              ontap: () {
                context.push(NamedRoute.CREATE_PRODUCT_PAGE);
              }),
          HomepageContainer(
              name: 'Create Order',
              ontap: () {
                context.push(NamedRoute.ORDER_PAGE);
              }),
        ],
      ),
    );
  }
}
