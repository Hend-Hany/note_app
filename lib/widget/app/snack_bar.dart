import 'package:flutter/material.dart';
import 'app_colors.dart';

void showSnackBar(
    BuildContext context, {
      required String title,
      bool showDismissButton = false,
      bool error = false,
    }) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(title),
      backgroundColor: error ? AppColors.red : AppColors.green,
      behavior: SnackBarBehavior.floating,
      action: showDismissButton ? SnackBarAction(
        onPressed: () {
          print('Dismiss');
        },
        textColor: Colors.yellow,
        label: "Dismiss",
      ) : null,
    ),
  );
}