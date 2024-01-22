import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurantmanagement/src/features/home/application/cubit/restaurant_owner_cubit.dart';
import 'package:restaurantmanagement/src/features/home/presentation/components/owner_widget.dart';

import '../components/not_owner_widget.dart';

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
            notOwner: (value) => const NotOwnerWidget(),
            owner: ((value) {
              return const RestaurantOwnerWidget();
            }),
          );
        },
      ),
    );
  }
}
