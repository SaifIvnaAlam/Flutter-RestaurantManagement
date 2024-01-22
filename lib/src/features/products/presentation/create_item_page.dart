import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../application/Item_cubit/item_cubit.dart';
import '../domain/list_of_demo_items.dart';

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
          context.read<ItemCubit>().createNewItem("Test", 12.3);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> buttomModalSheet(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return const SizedBox(
          height: 400,
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    decoration:
                        InputDecoration(hintText: "Name of the Product"),
                  ),
                  TextField(
                    decoration:
                        InputDecoration(hintText: "Price Of the Product"),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
