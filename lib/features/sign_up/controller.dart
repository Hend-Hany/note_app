import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_flutter/core/caching_utils.dart';
import 'package:flutter_flutter/core/route_utils/route_utils.dart';
import 'package:flutter_flutter/features/home/veiw.dart';
import 'package:flutter_flutter/widget/app/snack_bar.dart';

class SignUpController {
  final formKey = GlobalKey<FormState>();
  String? name,email, password;

  Future<void> signUp(BuildContext context) async {
    formKey.currentState!.save();
    if (!formKey.currentState!.validate()) {
      return;
    }
    try {
      final response = await Dio().post(
        'https://ink-notes-app.onrender.com/api/v1/auth/login',
        data: {
          'email': email,
          'password': password,
          'name':name,
        },
      );
      await CachingUtils.cacheUser(response.data);
      RouteUtils.pushReplacement(
        context: context,
        view: HomeView(),
      );
    }on DioException catch (e) {
      showSnackBar(
        context,
        title: e.response?.data['message']??'',
        error: true,
      );
    }
  }
}
