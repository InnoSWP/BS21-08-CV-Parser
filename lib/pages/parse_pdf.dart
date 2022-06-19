import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:file_picker/file_picker.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:cv_parser/scripts/local_storage.dart';

Future<List> getFileBytes() async {
  Uint8List? fileBytes;
  String fileName = "";

  FilePickerResult? picked = await FilePicker.platform
      .pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);

  if (picked != null && picked.files.isNotEmpty) {
    fileBytes = picked.files.first.bytes;
    fileName = picked.files.first.name;
  }

  return [fileName, fileBytes];
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

Future<void> parseFile() async {
  //Load the PDF document.
  final List<dynamic> file = await getFileBytes();
  final String fileName = file[0];
  final PdfDocument document = PdfDocument(inputBytes: file[1] as Uint8List);

  //Create PDF text extractor to extract text.
  final PdfTextExtractor extractor = PdfTextExtractor(document);

  //Extract text.
  final String text = extractor.extractText();

  //Dispose the document.
  document.dispose();

  //Convert text to json.
  var json = await textTojson(text);

  //save the text to local storage
  save(fileName, json);
}
