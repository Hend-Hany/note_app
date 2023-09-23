import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_flutter/core/caching_utils.dart';
import 'package:flutter_flutter/core/network_utils.dart';
import 'package:flutter_flutter/core/route_utils/route_utils.dart';
import 'package:flutter_flutter/features/home/veiw.dart';
import 'package:flutter_flutter/features/sign_up/state.dart';
import 'package:flutter_flutter/widget/app/snack_bar.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(SignUpInit());

  final formKey = GlobalKey<FormState>();
  String? name,email, password;

  Future<void> signUp() async {
    formKey.currentState!.save();
    if (!formKey.currentState!.validate()) {
      return;
    }
    emit(SignUpLoading());
    try {
      final response = await NetworkUtils.post(
        'auth/register',
        data: {
          'name':name,
          "email":email,
          'password':password,
        }
      );
      await CachingUtils.cacheUser(response.data);
      RouteUtils.pushAndPopAll(HomeView());
    } on DioException catch (e) {
      showSnackBar(
        e.response?.data['message'] ?? '',
        error: true,
      );
    }
    emit(SignUpInit());
  }
}
