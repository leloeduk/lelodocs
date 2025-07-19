import 'package:hive/hive.dart';

part 'exam_model.g.dart';

@HiveType(typeId: 1)
class Exam extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String title;

  @HiveField(2)
  int year;

  @HiveField(3)
  String subject;

  @HiveField(4)
  String examType; // rouge / blanc

  @HiveField(5)
  String diplomaType; // none / bepec / bac

  @HiveField(6)
  String? serieBac; // A, C, D, etc.

  @HiveField(7)
  String examFileUrl;

  @HiveField(8)
  String? correctionFileUrl;

  @HiveField(9)
  bool isPremium;

  @HiveField(10)
  DateTime createdAt;

  Exam({
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

  factory Exam.fromJson(Map<String, dynamic> json) {
    return Exam(
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
