// domain/repositories/exam_repository.dart
import '../entities/exam.dart';

abstract class ExamRepository {
  Future<List<Exam>> getExams();
}
