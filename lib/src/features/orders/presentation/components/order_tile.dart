import 'package:flutter/material.dart';

class OrderTile extends StatelessWidget {
  final String orderBy;
  final String totalCost;
  final String orderDate;

  const OrderTile({
    super.key,
    required this.orderBy,
    required this.orderDate,
    required this.totalCost,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100,
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              orderBy,
            ),
            Text(
              totalCost,
            ),
            Text(
              orderDate,
            ),
          ],
        ),
      ),
    );
  }
}
