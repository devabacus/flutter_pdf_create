import 'package:flutter/material.dart';
import 'package:flutter_pdf_test/myPdf.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  PdfRoutine pdfRoutine = PdfRoutine();

  @override
  void initState() {
    pdfRoutine.createPdf("Hello. how are you?");

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Pdf create test"),
        ),
      ),
    );
  }

}
