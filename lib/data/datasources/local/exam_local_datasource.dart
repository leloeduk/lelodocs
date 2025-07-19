import 'package:hive/hive.dart';
import 'package:lelodocs/data/models/exam_model.dart';

class ExamLocalDataSource {
  final Box<dynamic> box;

  ExamLocalDataSource(this.box);

  Future<void> cacheExams(List<ExamModel> exams) async {
    await box.put('exams', exams);
  }

  List<ExamModel> getCachedExams() {
    return box.get('exams', defaultValue: []) as List<ExamModel>;
  }
}
