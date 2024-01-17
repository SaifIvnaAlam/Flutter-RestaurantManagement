part of 'create_restaurant_cubit.dart';

@freezed
class CreateRestaurantState with _$CreateRestaurantState {
  const factory CreateRestaurantState.initial() = _Initial;
  const factory CreateRestaurantState.success() = _Success;
  const factory CreateRestaurantState.error(ShowError error) = _Error;
}
