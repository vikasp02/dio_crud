import 'package:dio/dio.dart';
import 'dio_handler.dart';

class ApiService {
  Dio _dio = getIt<DioHandler>().dio;

  Future<Map<String, dynamic>?> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        '/auth/login',
        data: {'email': email, 'password': password},
      );
      return response.data;
    } catch (e) {
      if (e is DioException) {
        print('Login error: ${e.message}');
        if (e.response != null) {
          print('Status code: ${e.response?.statusCode}');
          print('Response data: ${e.response?.data}');
        }
      }
      return null;
    }
  }

  Future<Map<String, dynamic>?> getFaqs() async {
    try {
      final response = await _dio.get('/faqs'); // Adjust endpoint as needed
      return response.data;
    } catch (e) {
      if (e is DioException) {
        print(
          'FAQ Fetch Error: ${e.response?.statusCode} - ${e.response?.data}',
        );
      }
      return null;
    }
  }
}
