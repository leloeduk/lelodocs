// data/repositories/exam_repository_impl.dart
import '../../domain/entities/exam.dart';
import '../../domain/repositories/exam_repository.dart';
import '../datasources/exam_remote_data_source.dart';

class ExamRepositoryImpl implements ExamRepository {
  final ExamRemoteDataSource remoteDataSource;

  ExamRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Exam>> getExams() async {
    return await remoteDataSource.fetchExams();
  }
}
