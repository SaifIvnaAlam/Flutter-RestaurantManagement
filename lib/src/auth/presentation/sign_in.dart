import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurantmanagement/src/constants/utils/app_colors.dart';
import 'package:restaurantmanagement/src/constants/utils/app_spacing.dart';
import 'package:restaurantmanagement/src/constants/utils/app_font_style.dart';
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Orange",
                  style: KFontStyle.h1Style.copyWith(color: Colors.orange),
                ),
                Text(
                  "Orange is a powerful and free Restaurant Management tool designed to streamline and enhance your restaurant operations. With user-friendly features and a robust set of tools, Orange empowers restaurant owners and staff to efficiently manage orders, inventory, and overall business processes",
                  style: KFontStyle.body1.copyWith(
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
                verticalSpacing64,
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  height: 60,
                  width: double.infinity,
                  child: MaterialButton(
                    color: AppColors.darkGreen,
                    onPressed: () async {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Signing in...'),
                        ),
                      );
                      context.read<AuthCubit>().SignInUser();
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    },
                    child: Text(
                      'Log in with Google',
                      style: KFontStyle.body1
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
