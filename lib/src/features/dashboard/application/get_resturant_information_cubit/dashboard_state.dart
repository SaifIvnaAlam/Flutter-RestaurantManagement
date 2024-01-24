part of 'dashboard_cubit.dart';

@freezed
class DashboardState with _$DashboardState {
  const factory DashboardState.Loading() = _Loading;
  const factory DashboardState.loaded() = _Loaded;
  const factory DashboardState.error(ShowError error) = _Error;
}
