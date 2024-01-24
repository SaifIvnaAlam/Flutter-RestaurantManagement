import '../domain/interface/i_dashboard_repository.dart';
import 'package:restaurantmanagement/src/core/show_error.dart';
import 'package:restaurantmanagement/src/constants/firebase_helpers/firestore_helper_functions.dart';
import 'package:restaurantmanagement/src/features/restaurants/domain/entities/restaurant_model.dart';

// ignore_for_file: prefer_final_fields

class DashboardRepository implements IDashboardRepository {
  var _helper = FirebaseHelperFunctions();
  @override
  Future<RestaurantsModel> getUsersResturant() async {
    Klog.logMessage("Getting Users Resturant");
    var result = await _helper.userDoc();
    Klog.logMap(
      result.data()!['restaurant'],
    );

    throw UnimplementedError();
  }
}
