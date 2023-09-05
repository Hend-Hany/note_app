import 'package:flutter/material.dart';
import 'package:flutter_flutter/core/dimentions.dart';
import 'package:flutter_flutter/core/route_utils/route_utils.dart';
import 'package:flutter_flutter/core/validate_utils.dart';
import 'package:flutter_flutter/features/sign_up/controller.dart';
import 'package:flutter_flutter/widget/app/app_aapbar.dart';
import 'package:flutter_flutter/widget/app/app_button.dart';
import 'package:flutter_flutter/widget/app/app_colors.dart';
import 'package:flutter_flutter/widget/app/app_text.dart';
import 'package:flutter_flutter/widget/app/app_text_field.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}
  class _SignUpViewState extends State<SignUpView> {
  SignUpController controller = SignUpController();
  bool isLoading = false;

  void toggleLoading(bool value) {
  isLoading = value;
  setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
        enableBackButton: true,
      ),
      body: Form(
        key: controller.formKey,
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            SizedBox(
              height: 32.height,
            ),
            AppText(
              title: 'Note App',
              textAlign: TextAlign.center,
              fontSize: 40,
              fontWeight: FontWeight.w700,
            ),
            SizedBox(
              height: 40.height,
            ),
            AppText(
              title: 'Sign Up',
              textAlign: TextAlign.center,
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(
              height: 48.height,
            ),
            AppTextField(
              hint: 'Name',
              onSaved: (v) => controller.email = v,
              validator: ValidateUtils.name,
            ),
            Divider(
              height: 20,
              color: AppColors.gray,
            ),
            AppTextField(
              hint: 'Email',
              onSaved: (v) => controller.email = v,
              validator: ValidateUtils.email,
            ),
            Divider(
              height: 20,
              color: AppColors.gray,
            ),
            AppTextField(
              hint: 'Password',
              onSaved: (v) => controller.password = v,
              validator: ValidateUtils.password,
            ),
            SizedBox(
              height: 64.height,
            ),
            AppButton(
              title: 'Sign up',
              isLoading: isLoading,
              onTap: () async {
                toggleLoading(true);
                await controller.signUp(context);
                toggleLoading(false);
              },
            ),
            SizedBox(
              height: 48.height,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText(
                  title: 'Do you have an account?',
                  color: AppColors.gray,
                ),
                SizedBox(
                  width: 4.width,
                ),
                AppText(
                  title: 'Login!',
                  textDecoration: TextDecoration.underline,
                  onTap: () => RouteUtils.pop(
                    context
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
