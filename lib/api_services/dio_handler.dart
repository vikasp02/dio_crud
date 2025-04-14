import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class DioHandler {
  final Dio dio;
  DioHandler._internal()
    : dio = Dio(
        BaseOptions(
          baseUrl: "http://192.168.1.103:5000/api",
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
  }
  static void setup() {
    getIt.registerLazySingleton(() => DioHandler._internal());
  }
}
