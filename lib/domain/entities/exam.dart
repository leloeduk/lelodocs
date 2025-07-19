// domain/entities/exam.dart
import 'package:equatable/equatable.dart';

class Exam extends Equatable {
  final String id;
  final String title;
  final int year;
  final String subject;
  final String examType;
  final String diplomaType;
  final String? serieBac;
  final String examFileUrl;
  final String? correctionFileUrl;
  final bool isPremium;
  final DateTime createdAt;

  const Exam({
    required this.id,
    required this.title,
    required this.year,
    required this.subject,
    required this.examType,
    required this.diplomaType,
    this.serieBac,
    required this.examFileUrl,
    this.correctionFileUrl,
    required this.isPremium,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [id, title, year];
}
