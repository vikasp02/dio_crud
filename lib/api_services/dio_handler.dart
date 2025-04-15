import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class DioHandler {
  final Dio dio;
  DioHandler._internal()
    : dio = Dio(
        BaseOptions(
          baseUrl: "http://192.168.1.103:5000/api", //contact-management
          // baseUrl: "https://dummyjson.com",
          // baseUrl: "http://65.1.155.249:9010/api", //zponz
          connectTimeout: const Duration(milliseconds: 5000),
          receiveTimeout: const Duration(milliseconds: 3000),
        ),
      ) {
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: false,
        responseBody: true,
        error: true,
        compact: true,
      ),
    );
    // Add Token Interceptor
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final storage = FlutterSecureStorage();
          final token = await storage.read(key: 'accessToken');

          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }

          return handler.next(options);
        },
        onError: (e, handler) {
          // Optionally handle token errors here
          return handler.next(e);
        },
      ),
    );
  }
  static void setup() {
    getIt.registerLazySingleton(() => DioHandler._internal());
  }
}
