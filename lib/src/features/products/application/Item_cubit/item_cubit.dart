import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

import '../../domain/interface/i_product_repository.dart';
import '../../domain/product_model.dart';

// ignore_for_file: no_leading_underscores_for_local_identifiers

part 'item_cubit.freezed.dart';
part 'item_state.dart';

class ItemCubit extends Cubit<ItemState> {
  ItemCubit(this._iItemRepo) : super(const ItemState.initial());
  final IItemRepo _iItemRepo;

  Future<void> createNewItem(String name, double price) async {
    final _item = ProductModel(
      id: const Uuid().v4(),
      name: name,
      price: price,
      description: "",
      image: "",
    );

    bool isUploaded = await _iItemRepo.createProduct(_item);

    if (isUploaded) {
      emit(ItemState.uploaded(isUploaded));
    } else {
      emit(
        const ItemState.error(),
      );
    }
  }
}
