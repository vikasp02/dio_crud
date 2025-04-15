import 'package:dio_crud/models/login_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dio_crud/api_services/api_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthViewModel with ChangeNotifier {
  bool isLoading = false;
  String? errorMessage;
  bool isLoggedIn = false;
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<void> login(String email, String password) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final response = await ApiService().login(
        email: email,
        password: password,
      );

      if (response != null) {
        // final loginModel = LoginModel.fromJson(response);
        final loginModel = LoginModelContact.fromJson(response);

        // Save token securely
        await _storage.write(key: 'accessToken', value: loginModel.token);

        isLoggedIn = true;
        // Store token/user data if needed
      } else {
        errorMessage = 'Login failed. Please try again.';
      }
    } catch (e) {
      errorMessage = 'An error occurred during login.';
      if (kDebugMode) {
        print('Login error: $e');
      }
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> checkLoginStatus() async {
    final token = await _storage.read(key: 'accessToken');
    isLoggedIn = token != null;
    notifyListeners();
  }
}
