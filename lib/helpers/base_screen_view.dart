import 'package:boiler_plate/routes/app_routes.dart';
import 'package:flutter/material.dart';

mixin BaseScreenView {
  void showSnackbar(String message, {Color? color});
  void navigateToScreen(AppRoute appRoute, {Map<String, String>? params});
}
