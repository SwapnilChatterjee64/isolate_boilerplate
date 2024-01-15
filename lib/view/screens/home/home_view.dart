import 'package:boiler_plate/domain/providers/providers.dart';
import 'package:boiler_plate/helpers/base_screen_view.dart';
import 'package:boiler_plate/routes/app_routes.dart';
import 'package:boiler_plate/utils/utils.dart';
import 'package:boiler_plate/view/screens/home/home_view_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> with BaseScreenView {
  late final HomeViewModel _viewModel;
  @override
  void initState() {
    super.initState();
    _viewModel = ref.read(homeViewModel);
    _viewModel.attachView(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(),
          ElevatedButton(
              onPressed: () {
                context.setLocale(const Locale('en'));
              },
              child: Text(Strings.english),),
          gapH16,
          ElevatedButton(
              onPressed: () {
                context.setLocale(const Locale('hi'));
              },
              child: Text(Strings.hindi),),
          gapH16,
          ElevatedButton(
              onPressed: () {
                _viewModel.showSnackbar("wohooo!!!!");
              },
              child: Text(Strings.showSnackbar),),
          gapH16,
          ElevatedButton(
              onPressed: () {
                _viewModel.navigateToSecondScreen();
              },
              child: Text(Strings.page2),),
          gapH16,
          ElevatedButton(
              onPressed: () {
                ref.read(themeProvider).toggleThemeMode();
              },
              child: Text(Strings.theme),),
        ],
      ),
    );
  }

  @override
  void navigateToScreen(AppRoute appRoute, {Map<String, String>? params}) {
    context.pushNamed(appRoute.name, pathParameters: params ?? {},
        // {"fid": NavBarScreens.data[1].id},
        );
  }

  @override
  void showSnackbar(String message, {Color? color}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
      ),
    );
  }
}
