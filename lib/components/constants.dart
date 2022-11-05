import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart ' as pw;

Future screenToPdf(String fileName, Uint8List screenShot, context) async {
  // final box = context.findRenderObject() as RenderBox?;
  pw.Document pdf = pw.Document();
  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (context) {
        return pw.Expanded(
          child: pw.Image(pw.MemoryImage(screenShot), fit: pw.BoxFit.contain),
        );
      },
    ),
  );
  String path = (await getApplicationDocumentsDirectory()).path;
  File pdfFile = await File('$path/$fileName.pdf').create();

  pdfFile.writeAsBytesSync(await pdf.save());
  ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Pdf File Saved Successfully')));
  //await Share.shareXFiles([XFile(pdfFile.path)]);
  // await Share.shareXFiles([XFile(pdfFile.path)],
  //     text: 'grat pic',
  //     subject: 'subnjec',
  //     sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
  // await Share.shareFiles([pdfFile.path], text: 'Great picture');
}

Future<dynamic> ShowCapturedWidget(
    BuildContext context, Uint8List capturedImage) {
  return showDialog(
    useSafeArea: false,
    context: context,
    builder: (context) => Scaffold(
      appBar: AppBar(
        title: Text("Captured widget screenshot"),
      ),
      body: Center(
          child: capturedImage != null
              ? Image.memory(capturedImage)
              : Container()),
    ),
  );
}
