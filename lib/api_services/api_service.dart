import 'package:dio/dio.dart';
import 'package:dio_crud/models/login_model.dart';
import 'dio_handler.dart';

class ApiService {
  Dio _dio = getIt<DioHandler>().dio;

  Future<LoginModel?> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        '/auth/login',
        data: {'email': email, 'password': password},
      );
      return LoginModel.fromJson(response.data);
    } catch (e) {
      throw Exception("Login failed: ${e.toString()}");
    }
  }
}
