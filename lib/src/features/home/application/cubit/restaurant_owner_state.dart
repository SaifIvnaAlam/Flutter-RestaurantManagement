part of 'restaurant_owner_cubit.dart';

@freezed
class RestaurantOwnerState with _$RestaurantOwnerState {
  const factory RestaurantOwnerState.loading() = _Loading;
  const factory RestaurantOwnerState.owner() = _Owner;
  const factory RestaurantOwnerState.notOwner() = _NotOwner;
}
