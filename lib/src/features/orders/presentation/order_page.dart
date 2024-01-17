import 'package:flutter/material.dart';
import 'package:restaurantmanagement/src/features/orders/domain/order_demo_data.dart';
import 'package:restaurantmanagement/src/features/orders/presentation/components/order_tile.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: demoOrderData.length,
        itemBuilder: (BuildContext context, int index) {
          return OrderTile(
            orderBy: demoOrderData[index].orderBy,
            orderDate: demoOrderData[index].orderDate,
            totalCost: demoOrderData[index].totalPrice.toString(),
          );
        },
      ),
    );
  }
}
