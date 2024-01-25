import 'package:restaurantmanagement/src/constants/firebase_helpers/firestore_helper_functions.dart';
import 'package:restaurantmanagement/src/core/show_error.dart';
import 'package:restaurantmanagement/src/features/restaurants/domain/entities/restaurant_model.dart';

import '../domain/interface/i_dashboard_repository.dart';

// ignore_for_file: prefer_final_fields

class DashboardRepository implements IDashboardRepository {
  var _helper = FirebaseHelperFunctions();
  @override
  Future<RestaurantsModel> getUsersRestaurant() async {
    var result = await _helper.getCurrenUser();

    if (result.restaurant != null) {
      Klog.logMessage(result.restaurant!);
      var _userRestaurant =
          await _helper.getUsersRestaurant(restaurantId: result.restaurant!);
      Klog.logMap(_userRestaurant.toMap());
      return _userRestaurant;
    }
    Klog.logMessage(
      result.restaurant ?? "resturant Not found",
    );

    throw UnimplementedError();
  }
}
