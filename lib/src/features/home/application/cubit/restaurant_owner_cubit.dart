import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurantmanagement/src/features/home/domain/interface/i_home_repository.dart';
// ignore_for_file: no_leading_underscores_for_local_identifiers

part 'restaurant_owner_cubit.freezed.dart';
part 'restaurant_owner_state.dart';

class RestaurantOwnerCubit extends Cubit<RestaurantOwnerState> {
  RestaurantOwnerCubit(this._repo)
      : super(const RestaurantOwnerState.loading());
  final IHomeRepository _repo;

  Future<void> checkIfUserIsRestaurantOwner() async {
    var _isOwner = await _repo.isUserRestaurantOwner();
    if (_isOwner) {
      emit(const RestaurantOwnerState.owner());
    } else {
      emit(const RestaurantOwnerState.notOwner());
    }
  }
}
