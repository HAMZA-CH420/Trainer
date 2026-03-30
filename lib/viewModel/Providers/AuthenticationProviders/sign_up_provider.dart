import 'package:flutter/material.dart';

import '../../../DataBase/local/db_helper.dart';

class SignUpProvider with ChangeNotifier {
  LocalDataBase localDataBase = LocalDataBase.getInstance();

  Future<String?> createUser({
    required String userName,
    required String email,
    required String password,
    required String phoneNumber,
    required String type,
  }) async {
    return await localDataBase.newUser(
      userName: userName,
      email: email,
      password: password,
      phoneNumber: phoneNumber,
      type: type,
    );
  }

  void updateGoals({required String userId, required String goals}) async {
    await localDataBase.updateGoals(userId: userId, goals: goals);
    notifyListeners();
  }
}
