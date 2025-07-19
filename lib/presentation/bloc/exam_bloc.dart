import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_exams.dart';
import 'exam_event.dart';
import 'exam_state.dart';

class ExamBloc extends Bloc<ExamEvent, ExamState> {
  final GetExams getExams;

  ExamBloc(this.getExams) : super(ExamInitial()) {
    on<LoadExamsEvent>((event, emit) async {
      emit(ExamLoading());
      try {
        final exams = await getExams();
        emit(ExamLoaded(exams));
      } catch (e) {
        emit(ExamError("Erreur lors du chargement"));
      }
    });
  }
}
