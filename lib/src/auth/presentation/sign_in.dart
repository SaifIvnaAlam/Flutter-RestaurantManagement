import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurantmanagement/src/auth/application/auth_cubit/auth_cubit.dart';

// ignore_for_file: use_build_context_synchronously

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        state.whenOrNull(
          authenticated: (user) {
            context.pushReplacement('/homepage');
          },
        );
      },
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: TextButton(
              onPressed: () async {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Signing in...'),
                  ),
                );

                context.read<AuthCubit>().SignInUser();
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                // if (!result) {
                //   log('There is an error in the Sign in');
                // } else {
                //   context.go("/homepage");
                // }
              },
              child: const Text('Log in with Google'),
            ),
          ),
        );
      },
    );
  }
}
