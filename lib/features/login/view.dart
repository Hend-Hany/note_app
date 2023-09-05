import 'package:flutter/material.dart';
import 'package:flutter_flutter/core/dimentions.dart';
import 'package:flutter_flutter/core/route_utils/route_utils.dart';
import 'package:flutter_flutter/core/validate_utils.dart';
import 'package:flutter_flutter/features/login/controller.dart';
import 'package:flutter_flutter/features/sign_up/view.dart';
import 'package:flutter_flutter/widget/app/app_button.dart';
import 'package:flutter_flutter/widget/app/app_colors.dart';
import 'package:flutter_flutter/widget/app/app_text.dart';
import 'package:flutter_flutter/widget/app/app_text_field.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginController controller = LoginController();
  bool isLoading = false;

  void toggleLoading(bool value) {
    isLoading = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
              height: 48.height,
            ),
            AppText(
              title: 'Login',
              textAlign: TextAlign.center,
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(
              height: 64.height,
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
              title: 'Login',
              isLoading: isLoading,
              onTap: () async {
                toggleLoading(true);
                await controller.login(context);
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
                  title: 'Do not have an account!',
                  color: AppColors.gray,
                ),
                SizedBox(
                  width: 4.width,
                ),
                AppText(
                  title: 'Sign up!',
                  textDecoration: TextDecoration.underline,
                  onTap: () => RouteUtils.push(
                    context: context,
                    view: SignUpView(),
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
