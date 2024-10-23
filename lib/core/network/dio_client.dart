import 'package:dio/dio.dart';

class DioClient {
  static Dio createDio() {
    Dio dio = Dio(BaseOptions(
      baseUrl: 'https://jsonplaceholder.typicode.com/',
      connectTimeout: const Duration(milliseconds: 5000),
      receiveTimeout: const Duration(milliseconds: 3000),
    ));
    return dio;
  }
}
