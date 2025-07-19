import '../entities/exam.dart';
import '../repositories/exam_repository.dart';

class GetExams {
  final ExamRepository repository;

  GetExams(this.repository);

  Future<List<Exam>> call() async {
    return await repository.getExams();
  }
}
