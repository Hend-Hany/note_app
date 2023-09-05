import 'package:flutter/material.dart%20';
import 'package:flutter_flutter/core/dimentions.dart';
import 'package:flutter_flutter/widget/app/app_button.dart';
import 'package:flutter_flutter/widget/app/app_colors.dart';
import 'package:flutter_flutter/widget/app/app_text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppDialog extends StatelessWidget {
  const AppDialog({Key? key,
    required this.message,
    required this.confirmTitle,
    this.onCancel,
    required this.onConfirm,
  }) : super(key: key);

  static void show(
      BuildContext context,{
        required String message,
        String confirmTitle='Save',
        void Function()? onCancel,
        required void Function() onConfirm,
  }){
    showDialog(
        context: context,
        barrierDismissible: false,
        barrierColor: AppColors.white.withOpacity(.1),
        builder: (context)=>AppDialog(
            message:message,
            confirmTitle: confirmTitle,
            onConfirm: onConfirm,
            onCancel: onCancel,
        ),
    );
  }
  final String message;
  final String confirmTitle;
  final void Function()? onCancel;
  final void Function() onConfirm;


  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(
              FontAwesomeIcons.circleInfo,
              color: AppColors.darkGray,
              size: 40,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 28.height,horizontal: 20.height),
              child: AppText(
                title: message,
                fontSize: 24,
                textAlign: TextAlign.center,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: AppButton(
                    title: 'Discard',
                    color: AppColors.red,
                    onTap: (){
                      if(onCancel==null){
                        Navigator.pop(context);
                        return;
                      }
                      onCancel!();
                    },
                  ),
                ),
                SizedBox(width: 35.width,),
                Expanded(
                  child: AppButton(
                    title: confirmTitle,
                    color: AppColors.green,
                    onTap: onConfirm,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.height,),
          ],
        ),
      ),
    );
  }
}
