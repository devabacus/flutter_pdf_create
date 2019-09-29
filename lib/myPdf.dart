import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class PdfRoutine {
  final pdf = Document();


  createPdf(String data) async{
    final font = await rootBundle.load("fonts/Roboto-Regular.ttf");
    final ttf = Font.ttf(font);

    pdf.addPage(Page(
        pageFormat: PdfPageFormat.a4,
        build: (Context context) {
         return Center(child: Text(data, style: TextStyle(font: ttf, fontSize: 40)));
        }));
    savePDFfile();
  }

  savePDFfile() async {
    final output = await getExternalStorageDirectory();// use the [path_provider (https://pub.dartlang.org/packages/path_provider) library:

    final file = File("${output.path}/example.pdf");
    await file.writeAsBytes(pdf.save());
  }
}
