// core/injection_container.dart
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:lelodocs/data/datasources/exam_remote_data_source.dart';
import 'package:lelodocs/data/repositories/exam_repository_impl.dart';
import 'package:lelodocs/domain/repositories/exam_repository.dart';
import 'package:lelodocs/domain/usecases/get_exams.dart';
import 'package:lelodocs/presentation/bloc/exam_bloc.dart';

final sl = GetIt.instance;

void init() {
  // Bloc
  sl.registerFactory(() => ExamBloc(sl()));

  // Usecase
  sl.registerLazySingleton(() => GetExams(sl()));

  // Repository
  sl.registerLazySingleton<ExamRepository>(() => ExamRepositoryImpl(sl()));

  // Data source
  sl.registerLazySingleton<ExamRemoteDataSource>(
    () => ExamRemoteDataSourceImpl(sl()),
  );

  // External
  sl.registerLazySingleton(() => Dio());
}
