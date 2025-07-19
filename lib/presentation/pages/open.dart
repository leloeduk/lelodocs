import 'dart:io';
import 'package:dio/dio.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';

Future<void> downloadAndOpenPdf(String url, String fileName) async {
  final status = await Permission.storage.request();
  if (!status.isGranted) throw Exception('Permission refusée');

  final dir = await getApplicationDocumentsDirectory();
  final filePath = "${dir.path}/$fileName.pdf";

  final response = await Dio().download(url, filePath);
  if (response.statusCode == 200) {
    await OpenFile.open(filePath);
  } else {
    throw Exception("Échec du téléchargement");
  }
}
