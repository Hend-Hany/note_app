import 'package:flutter/material.dart';
import 'package:flutter_flutter/core/dimentions.dart';
import 'package:flutter_flutter/core/route_utils/route_utils.dart';
import 'package:flutter_flutter/core/validate_utils.dart';
import 'package:flutter_flutter/features/sign_up/cubit.dart';
import 'package:flutter_flutter/features/sign_up/state.dart';
import 'package:flutter_flutter/widget/app/app_aapbar.dart';
import 'package:flutter_flutter/widget/app/app_button.dart';
import 'package:flutter_flutter/widget/app/app_colors.dart';
import 'package:flutter_flutter/widget/app/app_text.dart';
import 'package:flutter_flutter/widget/app/app_text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: ( context) =>SignUpCubit(),
      child: Scaffold(
        appBar: AppAppBar(
          enableBackButton: true,
        ),
        body: Builder(
          builder: (context) {
            final cubit=BlocProvider.of<SignUpCubit>(context);
            return Form(
              key: cubit.formKey,
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
                    onSaved: (v) => cubit.name = v,
                    validator: ValidateUtils.name,
                  ),
                  Divider(
                    height: 20,
                    color: AppColors.gray,
                  ),
                  AppTextField(
                    hint: 'Email',
                    onSaved: (v) => cubit.email = v,
                    validator: ValidateUtils.email,
                  ),
                  Divider(
                    height: 20,
                    color: AppColors.gray,
                  ),
                  AppTextField(
                    hint: 'Password',
                    onSaved: (v) => cubit.password = v,
                    validator: ValidateUtils.password,
                  ),
                  SizedBox(
                    height: 64.height,
                  ),
                  BlocBuilder<SignUpCubit,SignUpStates>(
                    builder: ( context, state) {
                      return AppButton(
                      title: 'Sign up',
                      isLoading: state is SignUpLoading,
                      onTap: cubit.signUp,
                      );
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
                        onTap: RouteUtils.pop,
                      ),
                    ],
                  ),
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}
