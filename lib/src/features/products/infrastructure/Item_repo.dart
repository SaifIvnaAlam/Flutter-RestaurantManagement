import 'dart:developer';
import '../domain/item_model.dart';
import '../domain/interface/i_Item_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
