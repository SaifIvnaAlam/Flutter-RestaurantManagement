import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurantmanagement/src/core/show_error.dart';
import 'package:restaurantmanagement/src/features/dashboard/domain/interface/i_dashboard_repository.dart';

part 'dashboard_cubit.freezed.dart';
part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit(this._repo) : super(const DashboardState.Loading());

  final IDashboardRepository _repo;

  Future<void> getResturantInformation() async {
    _repo
        .getUsersRestaurant()
        .then((value) => emit(const DashboardState.loaded()))
        .catchError((e) {
      emit(
        DashboardState.error(
          ShowError(title: "Error Fetching Restuarant Data"),
        ),
      );
    });
  }
}
