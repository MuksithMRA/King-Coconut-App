import 'dart:io';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:permission_handler/permission_handler.dart';

class PdfApi {
  pw.Document pdf = pw.Document();
  Future generatePdf(Uint8List capturedImage) async {
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (context) {
          return pw.Expanded(
            child:
                pw.Image(pw.MemoryImage(capturedImage), fit: pw.BoxFit.fill),
          );
        },
      ),
    );
    if (Platform.isAndroid) {
      var status = await Permission.storage.status;
      if (status != PermissionStatus.granted) {
        status = await Permission.storage.request();
      }
      if (status.isGranted) {
        final bytes = await pdf.save();
        // var directory = Directory('/storage/emulated/0/Download').path;
        final dir = await getExternalStorageDirectory();
        final file = File('${dir!.path}/Coconut.pdf');

        await file.writeAsBytes(bytes);
        openFile(file);
      }
    } else if (Platform.isIOS) {
      final bytes = await pdf.save();
      var directory = await getApplicationDocumentsDirectory();

      final file = File('$directory/Coconut.pdf');

      await file.writeAsBytes(bytes);
      openFile(file);
    }
  }

  Future openFile(File file) async {
    var url = file.path;
    await OpenFile.open(url);
  }
}
