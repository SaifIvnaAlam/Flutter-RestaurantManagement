import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../features/products/infrastructure/Item_repo.dart';
import '../features/products/application/Item_cubit/item_cubit.dart';
import 'package:restaurantmanagement/src/routes/go_router_config.dart';
import '../features/profile/application/profile_cubit/profile_cubit.dart';
import 'package:restaurantmanagement/src/auth/infarstructure/auth_facade.dart';
import 'package:restaurantmanagement/src/auth/application/auth_cubit/auth_cubit.dart';
import 'package:restaurantmanagement/src/features/home/infrastructure/home_repository.dart';
import 'package:restaurantmanagement/src/features/home/application/cubit/restaurant_owner_cubit.dart';
import 'package:restaurantmanagement/src/features/restaurants/infrastructure/create_restaurant_repo.dart';
import 'package:restaurantmanagement/src/features/restaurants/application/create_Restaurant_cubit/create_restaurant_cubit.dart';

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
          create: (context) => ItemCubit(ItemRepository()),
        ),
        BlocProvider(
          create: (context) => RestaurantOwnerCubit(HomeRepository()),
        ),
        BlocProvider(
          create: (context) => CreateRestaurantCubit(CreateRestaurantRepo()),
        ),
        BlocProvider(
          create: (context) => ProfileCubit(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          canvasColor: Colors.grey[200],
          primarySwatch: Colors.blue,
          fontFamily: GoogleFonts.montserrat().fontFamily,
        ),
        routerConfig: router,
      ),
    );
  }
}
