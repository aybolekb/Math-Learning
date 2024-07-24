import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfReader extends StatelessWidget {
  final String pdfUrl;
  const PdfReader({super.key, required this.pdfUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kitap'),
      ),
      body: SfPdfViewer.asset(
        pdfUrl,
        canShowScrollHead: true,
      ),
    );
  }
}
