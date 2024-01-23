import 'dart:io';
import 'dart:developer';
import '../domain/entities/restaurant_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../domain/interface/i_create_restaurant_repo.dart';
import 'package:restaurantmanagement/src/core/show_error.dart';
import 'package:restaurantmanagement/src/constants/firebase_helpers/firestore_helper_functions.dart';

class CreateRestaurantRepo implements ICreateRestaurantRepo {
  final _helper = FirebaseHelperFunctions();
  @override
  Future<bool> createResturant(RestaurantsModel restaurant, File image) async {
    String result = await _helper.uploadRestuarantImageHelper(
      image,
      restaurant.id,
    );
    restaurant.image = result;
    CollectionReference resturantsCollection =
        FirebaseFirestore.instance.collection('resturants');
    try {
      resturantsCollection.doc().set(
            restaurant.toMap(),
          );
      Klog.logMessage("Resturant is Created");
      return true;
    } catch (e) {
      log("Error Creating Resturant: $e");
      return false;
    }
  }
}
