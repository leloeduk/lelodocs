part 'exam_model.g.dart';

@HiveType(typeId: 0)
class ExamModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;

  ExamModel({required this.id, required this.title});

  factory ExamModel.fromJson(Map<String, dynamic> json) {
    return ExamModel(id: json['id'], title: json['title']);
  }
}
