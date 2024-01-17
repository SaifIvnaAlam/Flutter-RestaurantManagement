import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:restaurantmanagement/src/features/create_resturant/domain/entities/restaurant_model.dart';
import 'package:restaurantmanagement/src/features/create_resturant/domain/interface/i_create_restaurant_repo.dart';

class CreateRestaurantRepo implements ICreateRestaurantRepo {
  @override
  Future<bool> createResturant(RestaurantsModel restaurant) async {
    CollectionReference resturantsCollection =
        FirebaseFirestore.instance.collection('resturants');
    try {
      resturantsCollection.doc(restaurant.restaurantId).set(
            restaurant.toMap(),
          );
      log("Resturant is Created");
      return true;
    } catch (e) {
      log("Error Creating Resturant: $e");
      return false;
    }
  }
}
