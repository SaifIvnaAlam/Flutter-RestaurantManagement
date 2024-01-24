import 'package:restaurantmanagement/src/core/show_error.dart';
import 'package:restaurantmanagement/src/features/home/domain/interface/i_home_repository.dart';
import 'package:restaurantmanagement/src/constants/firebase_helpers/firestore_helper_functions.dart';
// ignore_for_file: no_leading_underscores_for_local_identifiers

class HomeRepository implements IHomeRepository {
  final _fireStore = FirebaseHelperFunctions();
  @override
  Future<bool> isUserRestaurantOwner() async {
    var _userDocResult = await _fireStore.userDoc();
    Klog.logMap(_userDocResult.data()!);

    if (_userDocResult.data()!['restaurant'] == null) {
      return false;
    } else {
      return true;
    }
  }
}
