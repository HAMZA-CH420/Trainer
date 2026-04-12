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
      await prefs.setString("userType", user['type']);
      await prefs.setBool("userLogged", true);
      return true;
    }
    return false;
  }

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
      await prefs.setString("userType", type);
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

  Future<List<Map<String, dynamic>>> getTrainer() async {
    return await localDataBase.getTrainer();
  }

  ///add trainer profile
  void addTrainerProfile({
    required String userId,
    required String about,
    required String specialization,
    required String experience,
    required String hourlyRate,
    required double rating,
  }) async {
    await localDataBase.addTrainerProfile(
      userId: userId,
      about: about,
      specialization: specialization,
      experience: experience,
      hourlyRate: hourlyRate,
      rating: rating,
    );
  }

  ///get trainers in a list
  Future<List<Map<String, dynamic>>> getTrainerProfiles() async {
    return await localDataBase.getTrainerProfile();
  }
}
