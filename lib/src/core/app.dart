import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurantmanagement/src/auth/application/auth_cubit/auth_cubit.dart';
import 'package:restaurantmanagement/src/auth/infarstructure/auth_facade.dart';
import 'package:restaurantmanagement/src/features/dashboard/application/get_resturant_information_cubit/dashboard_cubit.dart';
import 'package:restaurantmanagement/src/features/dashboard/infrastructure/dashboard_repository.dart';
import 'package:restaurantmanagement/src/features/home/application/cubit/restaurant_owner_cubit.dart';
import 'package:restaurantmanagement/src/features/home/infrastructure/home_repository.dart';
import 'package:restaurantmanagement/src/features/restaurants/application/create_Restaurant_cubit/create_restaurant_cubit.dart';
import 'package:restaurantmanagement/src/features/restaurants/infrastructure/create_restaurant_repo.dart';
import 'package:restaurantmanagement/src/routes/go_router_config.dart';

import '../features/products/application/create_product_cubit/item_cubit.dart';
import '../features/products/infrastructure/product_repository.dart';
import '../features/profile/application/profile_cubit/profile_cubit.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(AuthFacade()),
        ),
        BlocProvider(
          create: (context) => CreateProductCubit(ItemRepository()),
        ),
        BlocProvider(
          create: (context) => RestaurantOwnerCubit(HomeRepository()),
        ),
        BlocProvider(
          create: (context) => CreateRestaurantCubit(CreateRestaurantRepo()),
        ),
        BlocProvider(create: (context) => ProfileCubit()),
        BlocProvider(
          create: (context) => DashboardCubit(DashboardRepository()),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          platform: TargetPlatform.android,
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primaryContainer: Colors.white,
            primary: Colors.white,
            brightness: Brightness.light,
            background: Colors.black,
          ),
          textTheme: const TextTheme(
            titleMedium: TextStyle(
              fontFamily: 'geist',
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal,
              letterSpacing: 0,
            ),
            bodyMedium: TextStyle(
              fontFamily: 'geist',
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal,
              letterSpacing: 0,
            ),
            bodySmall: TextStyle(
              fontFamily: 'geist',
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal,
              letterSpacing: 0,
            ),
          ),
          canvasColor: Colors.black,
          fontFamily: 'geist',
        ),
        routerConfig: router,
      ),
    );
  }
}
