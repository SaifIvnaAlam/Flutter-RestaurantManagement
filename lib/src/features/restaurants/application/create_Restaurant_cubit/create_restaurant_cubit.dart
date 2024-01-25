import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurantmanagement/src/constants/firebase_helpers/firestore_helper_functions.dart';
import 'package:restaurantmanagement/src/core/show_error.dart';
import 'package:uuid/uuid.dart';

import '../../domain/entities/restaurant_model.dart';
import '../../domain/interface/i_create_restaurant_repo.dart';

// ignore_for_file: prefer_final_fields, no_leading_underscores_for_local_identifiers

part 'create_restaurant_cubit.freezed.dart';
part 'create_restaurant_state.dart';

class CreateRestaurantCubit extends Cubit<CreateRestaurantState> {
  CreateRestaurantCubit(this._repo)
      : super(const CreateRestaurantState.initial());
  ICreateRestaurantRepo _repo;

  Future<bool> createRestaurant(String name, File image) async {
    final _helper = await FirebaseHelperFunctions().getCurrenUser();
    final _restaurant = RestaurantsModel(
      name: name,
      id: const Uuid().v4(),
      image: "Path",
      createAt: FieldValue.serverTimestamp().toString(),
      admin: _helper.email,
    );
    var result = await _repo.createResturant(_restaurant, image);

    if (result) {
      emit(
        const CreateRestaurantState.success(),
      );
      return true;
    } else {
      emit(
        CreateRestaurantState.error(
          ShowError(title: "Creating Restaurant Faild", statusCode: 500),
        ),
      );
      return false;
    }
  }
}
