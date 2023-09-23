import 'package:flutter/material.dart';
import 'package:flutter_flutter/core/route_utils/route_utils.dart';
import 'app_colors.dart';

void showSnackBar(
  String message, {
  bool showSnackBar = false,
  bool error = false,
}) {
  ScaffoldMessenger.of(RouteUtils.context).hideCurrentSnackBar();
}
