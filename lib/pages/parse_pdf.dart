import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:file_picker/file_picker.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:cv_parser/scripts/local_storage.dart';
import 'package:universal_html/html.dart';

class PdfFile<T1, T2> {
  final T1 name;
  final T2 bytes;

  PdfFile(this.name, this.bytes);
}

Future<List<PdfFile>> getFilesBytes() async {
  List<PdfFile> files = [];

  FilePickerResult? picked = await FilePicker.platform.pickFiles(
    // add multiple files
    allowMultiple: true,
    type: FileType.custom,
    allowedExtensions: ['pdf'],
  );

  if (picked != null && picked.files.isNotEmpty) {
    // loop through files
    for (int i = 0; i < picked.files.length; i++) {
      // get file bytes
      Uint8List? fileBytes = picked.files[i].bytes;
      String fileName = picked.files[i].name;

      files.add(PdfFile(fileName, fileBytes));
    }
  }

  return files;
}

Future<String> textTojson(String text) async {
  var response = await http.post(
      Uri.parse('https://aqueous-anchorage-93443.herokuapp.com/CvParser'),
      headers: {
        "Access-Control-Allow-Origin": "*",
        "accept": "application/json",
        "content-type": "application/json",
      },
      body: jsonEncode({
        "text": text,
      }));

  if (response.statusCode == 200) {
    // print(response.body);
    return response.body;
  } else {
    return "Error: ${response.statusCode}";
  }
}

Future<String> mockAPI(String text) async {
  String mockResponse = '{"test": "c++", "test3": "python"}';
  return mockResponse;
}

Future<void> parseFiles() async {
  //Load the PDF document.
  final List<PdfFile> files = await getFilesBytes();

  for (int i = 0; i < files.length; i++) {
    final String fileName = files[i].name;
    final PdfDocument document = PdfDocument(inputBytes: files[i].bytes);

    //Create PDF text extractor to extract text.
    final PdfTextExtractor extractor = PdfTextExtractor(document);

    //Extract text.
    final String text = extractor.extractText();

    //Dispose the document.
    document.dispose();

    //save the text to local storage
    var json = await mockAPI(text);
    // var all = loadAll();
    save(fileName, json);
  }
}
