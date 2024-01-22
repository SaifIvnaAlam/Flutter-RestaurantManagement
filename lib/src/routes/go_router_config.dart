import 'package:go_router/go_router.dart';
import 'package:restaurantmanagement/src/core/splash.dart';
import '../features/products/presentation/create_item_page.dart';
import '../features/home/presentation/components/not_owner_widget.dart';
import 'package:restaurantmanagement/src/auth/presentation/sign_in.dart';
import 'package:restaurantmanagement/src/routes/go_router_constants.dart';
import 'package:restaurantmanagement/src/features/orders/presentation/order_page.dart';
import 'package:restaurantmanagement/src/features/home/presentation/page/home_page.dart';
import 'package:restaurantmanagement/src/features/dashboard/presentation/dashboard_page.dart';

GoRouter router = GoRouter(
  initialLocation: '/signinPage',
  routes: [
    GoRoute(
      name: NamedRoute.SPLASH_PAGE,
      path: '/',
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
      name: NamedRoute.CREATE_ITEM_PAGE,
      path: '/createitemPage',
      builder: (context, state) => const CreateItemPage(),
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
  ],
);
