import '../../domain/entities/exam.dart';

class ExamModel extends Exam {
  const ExamModel({
    required super.id,
    required super.title,
    required super.year,
    required super.subject,
    required super.examType,
    required super.diplomaType,
    super.serieBac,
    required super.examFileUrl,
    super.correctionFileUrl,
    required super.isPremium,
    required super.createdAt,
  });

  factory ExamModel.fromJson(Map<String, dynamic> json) {
    return ExamModel(
      id: json['id'],
      title: json['title'],
      year: json['year'],
      subject: json['subject'],
      examType: json['exam_type'],
      diplomaType: json['diploma_type'],
      serieBac: json['serie_bac'],
      examFileUrl: json['exam_file'],
      correctionFileUrl: json['correction_file'],
      isPremium: json['is_premium'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'year': year,
      'subject': subject,
      'exam_type': examType,
      'diploma_type': diplomaType,
      'serie_bac': serieBac,
      'exam_file': examFileUrl,
      'correction_file': correctionFileUrl,
      'is_premium': isPremium,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
