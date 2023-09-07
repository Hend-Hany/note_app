import 'package:flutter/material.dart';
import 'package:flutter_flutter/widget/app/app_colors.dart';

class AppLoadingIndicator extends StatelessWidget {
  const AppLoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: AppColors.gray,
        strokeWidth: 1.5,
      ),
    );
  }
}
