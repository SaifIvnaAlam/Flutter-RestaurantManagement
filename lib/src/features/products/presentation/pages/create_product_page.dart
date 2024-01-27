import 'dart:io';
import 'package:flutter/material.dart';
import '../../../../core/show_error.dart';
import 'package:image_picker/image_picker.dart';
import 'package:restaurantmanagement/src/constants/components/button.dart';

class CreateProducPage extends StatefulWidget {
  const CreateProducPage({super.key});

  @override
  State<CreateProducPage> createState() => _CreateProducPageState();
}

class _CreateProducPageState extends State<CreateProducPage> {
  File? _selectedImage;

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _selectedImage = File(pickedFile.path);
      } else {
        Klog.logMessage('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Future<void> _dialogBuilder(BuildContext context) {
      return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Create Product'),
            content: SizedBox(
              height: 200,
              child: Column(
                children: [
                  const TextField(),
                  const TextField(),
                  Button(ontap: _pickImage, title: "Pick image"),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: const Text('Dismiss'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: const Text('Create'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      body: const Center(
        child: Text("Create Product Pages"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _dialogBuilder(context);
          // buttomModalSheet(context);
          // context.read<CreateProductCubit>().createNewItem("Test", 12.3);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}







// Future<void> buttomModalSheet(BuildContext context) {
//   return showModalBottomSheet<void>(
//     context: context,
//     builder: (BuildContext context) {
//       return const SizedBox(
//         height: 400,
//         child: Center(
//           child: Padding(
//             padding: EdgeInsets.all(8.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 TextField(
//                   decoration: InputDecoration(hintText: "Name of the Product"),
//                 ),
//                 TextField(
//                   decoration: InputDecoration(hintText: "Price Of the Product"),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       );
//     },
//   );
// }
