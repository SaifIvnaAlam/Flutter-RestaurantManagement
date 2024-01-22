import '../item_model.dart';

// ignore_for_file: file_names

abstract class IItemRepo {
  Future<bool> addItem(ItemModel item);
  Future<List<ItemModel>> getAllItems();
}
