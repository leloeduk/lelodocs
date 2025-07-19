import 'package:dio/dio.dart';
import 'package:lelodocs/core/errors/exceptions.dart';

class DioClient {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://votre-api-railway.app',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
    ),
  );

  Future<Response> get(String endpoint) async {
    try {
      return await _dio.get(endpoint);
    } on DioException catch (e) {
      throw NetworkException(e.message ?? 'Network error');
    }
  }
}
