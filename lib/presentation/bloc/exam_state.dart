import '../../domain/entities/exam.dart';

abstract class ExamState {}

class ExamInitial extends ExamState {}

class ExamLoading extends ExamState {}

class ExamLoaded extends ExamState {
  final List<Exam> exams;
  ExamLoaded(this.exams);
}

class ExamError extends ExamState {
  final String message;
  ExamError(this.message);
}
