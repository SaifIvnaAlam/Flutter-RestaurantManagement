import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:restaurantmanagement/src/features/restaurants/application/create_Restaurant_cubit/create_restaurant_cubit.dart';

import '../../../constants/utils/app_colors.dart';
import '../../../constants/utils/app_font_style.dart';
import '../../../constants/utils/app_spacing.dart';
import '../../../core/show_error.dart';

// ignore_for_file: no_leading_underscores_for_local_identifiers

// ignore_for_file: unused_field

//TODO: Pick Image not working
class CreateResturantPage extends StatefulWidget {
  const CreateResturantPage({
    super.key,
  });

  @override
  State<CreateResturantPage> createState() => _CreateResturantPageState();
}

class _CreateResturantPageState extends State<CreateResturantPage> {
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

  final _nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _selectedImage != null
              ? Image.file(File(_selectedImage!.path))
              : Container(),
          const Center(
            child: Text("Let's Create a Restaurant"),
          ),
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(
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
              onPressed: _pickImage,
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
                if (_nameController.text.isNotEmpty) {
                  context
                      .read<CreateRestaurantCubit>()
                      .createRestaurant(_nameController.text, _selectedImage!)
                      .then(
                        (value) => {
                          if (value)
                            {context.pop()}
                          else
                            {
                              Klog.logMessage("Error Crearting Restaurant"),
                            }
                        },
                      );

                  context.pop();
                }
              },
              child: Text(
                "Create Restaurant",
                style: KFontStyle.buttonBold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
