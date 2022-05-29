import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPrefService {
  UserPrefService._();
  static final UserPrefService instance = UserPrefService._();

  Future<bool> isLoggedIn() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    if (sp.containsKey('loggedIn')) {
      return sp.getBool('loggedIn')!;
    }
    return false;
  }

  Future<void> setLogin(bool val) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.setBool('loggedIn', val);
    print("done");
  }
}
