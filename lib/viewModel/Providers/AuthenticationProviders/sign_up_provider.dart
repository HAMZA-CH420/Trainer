import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../DataBase/local/db_helper.dart';

class SignUpProvider extends ChangeNotifier {
  LocalDataBase localDataBase = LocalDataBase.getInstance();

  Future<String?> createUser({
    required String userName,
    required String email,
    required String password,
    required String phoneNumber,
    required String type,
  }) async {
    String? userId = await localDataBase.newUser(
      userName: userName,
      email: email,
      password: password,
      phoneNumber: phoneNumber,
      type: type,
    );
    
    if (userId != null) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString("userId", userId);
      await prefs.setBool("userLogged", true);
    }
    
    return userId;
  }

  void updateGoals({
    required String userId,
    required List<String> goals,
  }) async {
    await localDataBase.updateGoals(userId: userId, goals: goals);
    notifyListeners();
  }
}
