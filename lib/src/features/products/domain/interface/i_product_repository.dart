import '../product_model.dart';

// ignore_for_file: file_names

abstract class IItemRepo {
  Future<bool> createProduct(ProductModel item);
  Future<List<ProductModel>> getAllItems();
}
