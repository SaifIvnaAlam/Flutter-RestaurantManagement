import 'dart:developer';
import '../domain/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../domain/interface/i_product_repository.dart';



class ItemRepository implements IItemRepo {
  @override
  Future<List<ProductModel>> getAllItems() {
    throw UnimplementedError();
  }

  @override
  Future<bool> addItem(ProductModel item) async {
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
