import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:restaurantmanagement/src/constants/firebase_helpers/firebase_collections.dart';
import 'package:restaurantmanagement/src/constants/firebase_helpers/firestore_helper_functions.dart';
import 'package:restaurantmanagement/src/core/show_error.dart';

import '../domain/entities/restaurant_model.dart';
import '../domain/interface/i_create_restaurant_repo.dart';

//TODO: Set the data under Created Users Collection
class CreateRestaurantRepo implements ICreateRestaurantRepo {
  final _helper = FirebaseHelperFunctions();
  @override
  Future<bool> createResturant(RestaurantsModel restaurant, File image) async {
    if (image.path.isNotEmpty) {
      var result =
          await _helper.uploadRestuarantImageHelper(image, restaurant.id);
      restaurant.image = result;
    }

    CollectionReference resturantsCollection = FirebaseFirestore.instance
        .collection(CollectionNames.RESTAURANT_COLLECTION);
    try {
      resturantsCollection
          .doc(restaurant.id)
          .set(restaurant.toMap())
          .then((value) {
        _helper.updateUserDoc({"restaurant": restaurant.id});
        return true;
      });
      Klog.logMessage("Resturant is Created");
      return true;
    } catch (e) {
      log("Error Creating Resturant: $e");
      return false;
    }
  }
}
