import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lelodocs/presentation/bloc/exam_bloc.dart';
import 'package:lelodocs/presentation/bloc/exam_state.dart';
import 'package:lelodocs/presentation/pages/open.dart';

class ExamListPage extends StatefulWidget {
  const ExamListPage({super.key});

  @override
  State<ExamListPage> createState() => _ExamListPageState();
}

class _ExamListPageState extends State<ExamListPage> {
  String selectedYear = '2024';
  String selectedDiploma = 'bac';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Liste des Examens")),
      body: Column(
        children: [
          Row(
            children: [
              DropdownButton<String>(
                value: selectedYear,
                items: ['2022', '2023', '2024']
                    .map(
                      (year) =>
                          DropdownMenuItem(value: year, child: Text(year)),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedYear = value!;
                  });
                },
              ),
              const SizedBox(width: 10),
              DropdownButton<String>(
                value: selectedDiploma,
                items: ['bac', 'bepec', 'none']
                    .map(
                      (d) => DropdownMenuItem(
                        value: d,
                        child: Text(d.toUpperCase()),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedDiploma = value!;
                  });
                },
              ),
            ],
          ),
          Expanded(
            child: BlocBuilder<ExamBloc, ExamState>(
              builder: (context, state) {
                if (state is ExamLoading)
                  return const Center(child: CircularProgressIndicator());
                if (state is ExamLoaded) {
                  final filtered = state.exams.where((exam) {
                    return exam.year.toString() == selectedYear &&
                        exam.diplomaType == selectedDiploma;
                  }).toList();

                  if (filtered.isEmpty) {
                    return const Center(child: Text("Aucun examen trouvé"));
                  }

                  return ListView.builder(
                    itemCount: filtered.length,
                    itemBuilder: (context, index) {
                      final exam = filtered[index];
                      return ListTile(
                        title: Text(exam.title),
                        subtitle: Text("${exam.subject} - ${exam.year}"),
                        trailing: const Icon(Icons.picture_as_pdf),
                        onTap: () =>
                            downloadAndOpenPdf(exam.examFileUrl, exam.title),
                      );
                    },
                  );
                }
                if (state is ExamError)
                  return Center(child: Text(state.message));
                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }
}
