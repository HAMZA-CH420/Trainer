import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trainer/DataBase/local/db_helper.dart';

class DbProvider extends ChangeNotifier {
  LocalDataBase db = LocalDataBase.getInstance();

  Future<bool> loginUser({
    required String email,
    required String password,
  }) async {
    var user = await db.loginUser(email: email, password: password);
    if (user != null) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString("userId", user['userId']);
      await prefs.setBool("userLogged", true);
      return true;
    }
    return false;
  }
}
