import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurantmanagement/src/routes/go_router_constants.dart';
import 'package:restaurantmanagement/src/auth/application/auth_cubit/auth_cubit.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        state.map(
          initial: (_) {},
          authenticated: (state) {
            context.goNamed(NamedRoute.HOME_PAGE);
          },
          unAuthenticated: (_) => context.goNamed(NamedRoute.SIGNIN_PAGE),
        );
      },
      child: const Scaffold(
          body: Center(
        child: CircularProgressIndicator.adaptive(),
      )),
    );
  }
}
