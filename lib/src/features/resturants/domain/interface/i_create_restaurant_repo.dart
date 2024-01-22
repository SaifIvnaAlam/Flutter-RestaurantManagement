import '../entities/restaurant_model.dart';

abstract class ICreateRestaurantRepo {
  Future<bool> createResturant(RestaurantsModel restaurant);
}
