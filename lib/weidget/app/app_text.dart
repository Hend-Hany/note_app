import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppText extends StatelessWidget {
  const AppText( {
    Key? key,

    this.maxLines,
    this.color=AppColors.white,
    this.fontSize=14,
    this.fontWeight=FontWeight.w400,
    required this.title,
    this.fontFamily,
    this.textAlign,
  }) : super(key: key);

  final String title;
  final int? maxLines;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final String? fontFamily;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: maxLines,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: fontFamily
      ),
      textAlign: textAlign,
    );

  }
}
