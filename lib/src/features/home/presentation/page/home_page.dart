import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurantmanagement/src/features/home/application/cubit/restaurant_owner_cubit.dart';
import 'package:restaurantmanagement/src/features/home/presentation/components/owner_widget.dart';

import '../../../../routes/go_router_constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<RestaurantOwnerCubit>().checkIfUserIsRestaurantOwner();
    return Scaffold(
      body: BlocBuilder<RestaurantOwnerCubit, RestaurantOwnerState>(
        builder: (context, state) {
          return state.map(
            loading: (value) => const Center(
              child: CircularProgressIndicator.adaptive(),
            ),
            notOwner: (value) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("You do now own Any restaurant"),
                  TextButton(
                    onPressed: () {
                      context.goNamed(NamedRoute.CREATE_RESTURANT);
                    },
                    child: const Text("Create Restaurant"),
                  )
                ],
              ),
            ),
            owner: ((value) {
              return const RestaurantOwnerWidget();
            }),
          );
        },
      ),
    );
  }
}
