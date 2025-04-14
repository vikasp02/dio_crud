import 'dart:developer';

import 'package:dio_crud/models/login_model.dart';
import 'package:flutter/material.dart';
import 'package:dio_crud/api_services/api_service.dart';

class AuthViewModel with ChangeNotifier {
  bool isLoading = false;

  LoginModel? user;
  // LoginModel? get user => _user;

  Future<LoginModel?> login({
    required String email,
    required String password,
  }) async {
    isLoading = true;
    notifyListeners();

    try {
      user = await ApiService().login(email: email, password: password);
      // You can store token or user data here using secure storage or shared preferences
      isLoading = false;
      notifyListeners();
      log('Stored user: ${user?.toJson()}'); // Debug print
      return user;
    } catch (e) {
      isLoading = false;
      notifyListeners();
      rethrow;
    }
  }
}
