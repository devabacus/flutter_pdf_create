import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class PdfRoutine {
  final pdf = Document();


  createPdf(String data) {
    pdf.addPage(Page(
        pageFormat: PdfPageFormat.a4,
        build: (Context context) {
         return Center(child: Text(data));
        }));
    savePDFfile();
  }

  savePDFfile() async {
    final output = await getExternalStorageDirectory();// use the [path_provider (https://pub.dartlang.org/packages/path_provider) library:

    final file = File("${output.path}/example.pdf");
    await file.writeAsBytes(pdf.save());
  }
}
