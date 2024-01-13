import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:restaurantmanagement/src/features/create_item/domain/list_of_demo_items.dart';

class CreateItemPage extends StatelessWidget {
  const CreateItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: demoData.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(demoData[index].name),
              subtitle: Text(
                demoData[index].price.toString(),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          log("Taped");
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
