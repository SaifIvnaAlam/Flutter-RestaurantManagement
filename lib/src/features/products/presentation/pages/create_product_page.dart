import 'package:flutter/material.dart';

class CreateProducPage extends StatelessWidget {
  const CreateProducPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text("Create Product Pages"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          buttomModalSheet(context);
          // context.read<ItemCubit>().createNewItem("Test", 12.3);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
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
                  decoration: InputDecoration(hintText: "Name of the Product"),
                ),
                TextField(
                  decoration: InputDecoration(hintText: "Price Of the Product"),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
