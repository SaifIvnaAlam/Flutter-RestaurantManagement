import 'package:go_router/go_router.dart';
import 'package:restaurantmanagement/src/core/splash.dart';
import 'package:restaurantmanagement/src/auth/presentation/sign_in.dart';
import 'package:restaurantmanagement/src/routes/go_router_constants.dart';
import '../features/products/presentation/pages/create_product_page.dart';
import '../features/restaurants/presentation/create_restaurant_page.dart';
import 'package:restaurantmanagement/src/features/navbar/presentation/side_bar.dart';
import 'package:restaurantmanagement/src/features/orders/presentation/order_page.dart';
import 'package:restaurantmanagement/src/features/home/presentation/page/home_page.dart';
import 'package:restaurantmanagement/src/features/profile/presentation/profile_page.dart';
import 'package:restaurantmanagement/src/features/navbar/presentation/buttom_nav_bar.dart';
import 'package:restaurantmanagement/src/features/dashboard/presentation/dashboard_page.dart';
import 'package:restaurantmanagement/src/features/profile/presentation/components/user_profile_widget.dart';

GoRouter router = GoRouter(
  initialLocation: '/splashPage',
  routes: [
    GoRoute(
      name: NamedRoute.SPLASH_PAGE,
      path: '/splashPage',
      builder: (context, state) => SplashScreen(),
    ),
    GoRoute(
      name: NamedRoute.SIGNIN_PAGE,
      path: '/signinPage',
      builder: (context, state) => const SignInPage(),
    ),
    GoRoute(
      name: NamedRoute.HOME_PAGE,
      path: '/homepage',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      name: NamedRoute.DASHBOARD_PAGE,
      path: '/dasboardPage',
      builder: (context, state) => const DashBoardPage(),
    ),
    GoRoute(
      name: NamedRoute.CREATE_PRODUCT_PAGE,
      path: '/create_product_page',
      builder: (context, state) => const CreateProducPage(),
    ),
    GoRoute(
      name: NamedRoute.ORDER_PAGE,
      path: '/orderPage',
      builder: (context, state) => const OrderPage(),
    ),
    GoRoute(
      name: NamedRoute.CREATE_RESTURANT,
      path: '/createResturant',
      builder: (context, state) => const CreateResturantPage(),
    ),
    GoRoute(
      name: NamedRoute.NAV_BAR,
      path: '/nav_bar',
      builder: (context, state) => const NavBar(),
    ),
    GoRoute(
      name: NamedRoute.DISCORD_SIDEBAR,
      path: '/discord_sidebar',
      builder: (context, state) => const Sidebar(),
    ),
    GoRoute(
      name: NamedRoute.PROFILE_PAGE,
      path: '/profile_page',
      builder: (context, state) => ProfilePage(),
    ),
  ],
);
