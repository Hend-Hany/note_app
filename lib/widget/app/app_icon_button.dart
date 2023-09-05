import 'package:flutter/material.dart';
import 'package:flutter_flutter/core/dimentions.dart';
import 'package:flutter_flutter/widget/app/app_colors.dart';

class AppIconButton extends StatelessWidget {
  const AppIconButton({Key? key,
    required this.icon,
    required this.onTap,
    this.padding=EdgeInsets.zero,
  })
      : super(key: key);

  final IconData icon;
  final void Function()onTap;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:padding,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Container(
          width:50.width ,
          height: 50.width,
          child: Icon(icon,size: 24.height,),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: AppColors.darkGray
          ),
        ),
      ),
    );
  }
}
