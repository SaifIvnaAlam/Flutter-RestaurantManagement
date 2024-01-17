import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/material/app_bar.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurantmanagement/src/auth/domain/interfaces/i_auth_facade.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authFacade) : super(const AuthState.initial());
  final IAuthFacade _authFacade;

  Future<void> authCheckRequested() async {
    final user = await _authFacade.getSignedInUser();
    if (user != null) {
      emit(AuthState.authenticated(user));
    } else {
      emit(const AuthState.unAuthenticated());
    }
  }

  Future<void> SignInUser() async {
    var isUserSignedin = await _authFacade.signInWithGoogle();
    if (isUserSignedin) {
      authCheckRequested();
    } else {
      emit(const AuthState.unAuthenticated());
    }
  }

  Future<void> signedOut() async {
    await _authFacade.signOut();
    emit(
      const AuthState.unAuthenticated(),
    );
  }
}
