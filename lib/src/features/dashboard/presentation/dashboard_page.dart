import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurantmanagement/src/features/restaurants/domain/entities/restaurant_model.dart';
import 'package:restaurantmanagement/src/features/dashboard/application/get_resturant_information_cubit/dashboard_cubit.dart';

class DashBoardPage extends StatelessWidget {
  const DashBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<DashboardCubit>().getResturantInformation();
    return Scaffold(
      body: BlocBuilder<DashboardCubit, DashboardState>(
        builder: (context, state) {
          return state.map(
            loading: (value) => const Center(
              child: CircularProgressIndicator.adaptive(),
            ),
            error: (value) => const Text("Error loading Data"),
            loaded: (data) {
              return DashboardWidget(
                data: data.restaurant,
              );
            },
          );
        },
      ),
    );
  }
}

class DashboardWidget extends StatelessWidget {
  RestaurantsModel data;

  DashboardWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.network(data.image),
            Text("Restauarnt Name:  ${data.name}"),
          ],
        ),
        Text("Restauarnt Owner:  ${data.admin}"),
      ],
    );
  }
}
