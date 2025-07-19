import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lelodocs/core/get/injection_container.dart' as di;
import 'package:lelodocs/presentation/bloc/exam_bloc.dart';
import 'package:lelodocs/presentation/bloc/exam_event.dart';
import 'package:lelodocs/presentation/pages/exam_list_page.dart';
// import 'package:lelodocs/core/injection_container.dart' as di;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  di.init(); // Initialiser toutes les dépendances
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SmartDocs',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.red, useMaterial3: true),
      home: BlocProvider(
        create: (_) => di.sl<ExamBloc>()..add(LoadExamsEvent()),
        child: const ExamListPage(),
      ),
    );
  }
}
