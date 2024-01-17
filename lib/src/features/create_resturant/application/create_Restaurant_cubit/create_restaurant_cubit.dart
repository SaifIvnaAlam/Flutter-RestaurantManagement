import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurantmanagement/src/core/show_error.dart';
import 'package:restaurantmanagement/src/features/create_resturant/domain/entities/restaurant_model.dart';
import 'package:restaurantmanagement/src/features/create_resturant/domain/interface/i_create_restaurant_repo.dart';
import 'package:uuid/uuid.dart';

part 'create_restaurant_cubit.freezed.dart';
part 'create_restaurant_state.dart';

class CreateRestaurantCubit extends Cubit<CreateRestaurantState> {
  CreateRestaurantCubit(this._repo)
      : super(const CreateRestaurantState.initial());
  ICreateRestaurantRepo _repo;

  Future<void> createRestaurant(String name, File image) async {
    final _restaurant = RestaurantsModel(
        id: Uuid().v4(),
        restaurantId: name + Uuid().v4(),
        image: "Path",
        createAt: "",
        admin: "",
        members: []);
    var result = await _repo.createResturant(_restaurant);

    if (result) {
      emit(
        CreateRestaurantState.success(),
      );
    } else {
      emit(
        CreateRestaurantState.error(
          ShowError(title: "Creating Restaurant Faild", statusCode: 500),
        ),
      );
    }
  }
}
