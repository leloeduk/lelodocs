import 'dart:convert';
import 'package:dio/dio.dart';
import '../models/exam_model.dart';

abstract class ExamRemoteDataSource {
  Future<List<ExamModel>> fetchExams();
}

class ExamRemoteDataSourceImpl implements ExamRemoteDataSource {
  final Dio dio;

  ExamRemoteDataSourceImpl(this.dio);

  @override
  Future<List<ExamModel>> fetchExams() async {
    final response = await dio.get(
      'https://lelodocsapi.onrender.com/api/exams/',
    );

    if (response.statusCode == 200) {
      return (response.data as List)
          .map((json) => ExamModel.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load exams');
    }
  }
}
