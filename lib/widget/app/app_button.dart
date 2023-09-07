import 'package:flutter/material.dart';
import 'package:flutter_flutter/core/dimentions.dart';
import 'package:flutter_flutter/widget/app/app_loading_indicator.dart';
import 'app_colors.dart';
import 'app_text.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.title,
    this.onTap,
    this.color = AppColors.darkGray,
    this.isLoading=false,
  });

  final String title;
  final void Function()? onTap;
  final Color color;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    if(isLoading){
      return AppLoadingIndicator();
    }

    return InkWell(
      onTap: onTap,
      child: Container(
        height: 48.height,
        width: double.infinity,
        alignment: Alignment.center,
        child: AppText(
          title: title,
          color: AppColors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: color,
        ),
      ),
    );
  }
}