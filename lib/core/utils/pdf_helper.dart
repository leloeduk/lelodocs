import 'dart:typed_data';
import 'package:pdf/widgets.dart' as pw;

class PdfHelper {
  static Future<Uint8List> generateSimplePdf({
    required String title,
    required String content,
  }) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text(
              title,
              style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold),
            ),
            pw.SizedBox(height: 20),
            pw.Text(content, style: const pw.TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );

    return pdf.save();
  }
}
