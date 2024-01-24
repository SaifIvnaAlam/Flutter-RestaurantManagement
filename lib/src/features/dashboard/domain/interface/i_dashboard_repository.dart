import 'package:restaurantmanagement/src/features/restaurants/domain/entities/restaurant_model.dart';

abstract class IDashboardRepository {
  Future<RestaurantsModel> getUsersResturant();
}
