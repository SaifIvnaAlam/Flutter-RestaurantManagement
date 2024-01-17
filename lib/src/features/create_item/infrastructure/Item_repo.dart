import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:restaurantmanagement/src/features/create_item/domain/interface/i_Item_repo.dart';
import 'package:restaurantmanagement/src/features/create_item/domain/item_model.dart';

class ItemRepository implements IItemRepo {
  @override
  Future<List<ItemModel>> getAllItems() {
    throw UnimplementedError();
  }

  @override
  Future<bool> addItem(ItemModel item) async {
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
