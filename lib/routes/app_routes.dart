import 'package:boiler_plate/view/screens.dart';
import 'package:go_router/go_router.dart';

enum AppRoute { home, secondScreen }

// flutter packages pub run build_runner build --delete-conflicting-outputs
final routers = [
  GoRoute(
    path: '/',
    name: AppRoute.home.name,
    builder: (context, state) => const HomeView(),
  ),
  GoRoute(
    path: '/secondScreen',
    name: AppRoute.secondScreen.name,
    builder: (context, state) => const NewsListView(),
  ),
];
