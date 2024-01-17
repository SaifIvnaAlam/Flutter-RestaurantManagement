import 'package:restaurantmanagement/src/features/create_resturant/domain/entities/restaurant_model.dart';

abstract class ICreateRestaurantRepo {
  Future<bool> createResturant(RestaurantsModel restaurant);
}
