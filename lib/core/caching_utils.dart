import 'package:shared_preferences/shared_preferences.dart';

class CachingUtils{
  static late SharedPreferences _pref;

  static Future<void>init()async{
    _pref=await SharedPreferences.getInstance();
  }
  static Future<void>cacheUser(Map<String,dynamic>data)async{
    await _pref.setString('email',data['data']['email']);
    await _pref.setString('name',data['data']['name']);
    await _pref.setString('token',data['token']);
    await _pref.setString('user_id',data['data']['_id']);
  }
  static Future<void>deleteUser()async{
    await _pref.remove('email');
    await _pref.remove('name');
    await _pref.remove('token');
    await _pref.remove('user_id');
  }
  static bool get isLogged{
    return _pref.containsKey('token');
  }
  static String get email{
    return _pref.getString('email')??'';
  }
  static String get userId{
    return _pref.getString('user_id')??'';
  }
  static String get name{
    return _pref.getString('name')??'';
  }
  static String get token{
    return _pref.getString('token')??'';
  }
}