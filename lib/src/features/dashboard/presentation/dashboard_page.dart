import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurantmanagement/src/features/dashboard/application/get_resturant_information_cubit/dashboard_cubit.dart';

import 'components/dashbord_widget.dart';

class DashBoardPage extends StatelessWidget {
  const DashBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<DashboardCubit>().getResturantInformation();
    return Scaffold(
      backgroundColor: Colors.black,
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
