part of 'dashboard_cubit.dart';

@freezed
class DashboardState with _$DashboardState {
  const factory DashboardState.loading() = _Loading;
  const factory DashboardState.loaded(RestaurantsModel restaurant) = _Loaded;
  const factory DashboardState.error(ShowError error) = _Error;
}
