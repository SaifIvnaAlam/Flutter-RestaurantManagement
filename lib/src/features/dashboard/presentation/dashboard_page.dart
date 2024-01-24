import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurantmanagement/src/features/dashboard/application/get_resturant_information_cubit/dashboard_cubit.dart';

class DashBoardPage extends StatelessWidget {
  const DashBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<DashboardCubit>().getResturantInformation();
    return const Scaffold(
      body: Center(
        child: Text("Dashboard"),
      ),
    );
  }
}
