import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurantmanagement/src/auth/application/auth_cubit/auth_cubit.dart';
import 'package:restaurantmanagement/src/auth/infarstructure/auth_facade.dart';
import 'package:restaurantmanagement/src/features/create_item/application/Item_cubit/item_cubit.dart';
import 'package:restaurantmanagement/src/features/create_item/infrastructure/Item_repo.dart';
import 'package:restaurantmanagement/src/routes/go_router_config.dart';

class App extends StatelessWidget {
  App({super.key});
  // final _controller = SidebarXController(selectedIndex: 0, extended: true);
  // final _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(AuthFacade()),
        ),
        BlocProvider(
          create: (context) => ItemCubit(
            ItemRepository(),
          ),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: true,
        routerConfig: router,

        //   home: Builder(
        //     builder: (context) {
        //       final isSmallScreen = MediaQuery.of(context).size.width < 600;
        //       return Scaffold(
        //         key: _key,
        //         appBar: isSmallScreen
        //             ? AppBar(
        //                 backgroundColor: Colors.red,
        //                 leading: IconButton(
        //                   onPressed: () {
        //                     _key.currentState?.openDrawer();
        //                   },
        //                   icon: const Icon(Icons.menu),
        //                 ),
        //               )
        //             : null,
        //         drawer: SideBarWrapper(controller: _controller),
        //         body: Row(
        //           children: [
        //             if (!isSmallScreen) SideBarWrapper(controller: _controller),
        //           ],
        //         ),
        //       );
        //     },
        //   ),
      ),
    );
  }
}

String _getTitleByIndex(int index) {
  switch (index) {
    case 0:
      return 'Home';
    case 1:
      return 'Search';
    case 2:
      return 'People';
    case 3:
      return 'Favorites';
    case 4:
      return 'Custom iconWidget';
    case 5:
      return 'Profile';
    case 6:
      return 'Settings';
    default:
      return 'Not found page';
  }
}
