import 'dart:developer';
import '../domain/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../domain/interface/i_product_repository.dart';
import 'package:restaurantmanagement/src/core/show_error.dart';
import 'package:restaurantmanagement/src/constants/firebase_helpers/firestore_helper_functions.dart';

class ItemRepository implements IItemRepo {
  var _helper = FirebaseHelperFunctions();
  @override
  Future<List<ProductModel>> getAllItems() {
    throw UnimplementedError();
  }

  @override
  Future<bool> createProduct(ProductModel item) async {
    Klog.logMessage("CreateProduct Pressed Repo");

    _helper.getCurrenUser();
    CollectionReference resturantsCollection =
        FirebaseFirestore.instance.collection('resturants');

    try {
      resturantsCollection
          .doc()
          .collection("items")
          .doc(item.id)
          .set(item.toMap());
      return true;
    } catch (e) {
      log("Error adding item: $e");
      return false;
    }
  }
}
