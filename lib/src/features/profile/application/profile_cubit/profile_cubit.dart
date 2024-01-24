import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurantmanagement/src/auth/domain/user_model.dart';
import 'package:restaurantmanagement/src/constants/firebase_helpers/firestore_helper_functions.dart';
// ignore_for_file: prefer_final_fields

part 'profile_cubit.freezed.dart';
part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(const ProfileState.loading());
  var _helper = FirebaseHelperFunctions();

  Future<void> getUserInfo() async {
    _helper.getCurrenUser().then((value) => emit(ProfileState.loaded(value)));
  }
}
