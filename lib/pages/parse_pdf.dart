import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';
import 'package:cv_parser/pages/PdfFile.dart';
import 'package:http/http.dart' as http;
import 'package:file_picker/file_picker.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:cv_parser/scripts/local_storage.dart';
import 'package:universal_html/html.dart';

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

  Random random = new Random();
  
  int randomNumber = random.nextInt(4);

  List<String> mockResponses = [];

  String mockResponse1 =
      '[{"match":"Java","label":"CsSkill","sentence":""},{"match":"C++","label":"CsSkill","sentence":""},{"match":"Indian Institue of Technology, Delhi","label":"ORG","sentence":"Bachelors of Technology from Indian Institute of Technology, Delhi"},{"match":"English","label":"LANGUAGE","sentence":"Languages:Hindi (Native), English (Fluent), Russian (beginner)"},{"match":"github.com/racoon1991","label":"Links","sentence":"github.com/racoon1991"},{"match":"racoon1991@gmail.com","label":"emails","sentence":"racoon1991@gmail.com"}]';

  String mockResponse2 =
      '[{"match":"research","label":"CsSkill","sentence":""},{"match":"Innopolis University - Phd","label":"ORG","sentence":"Innopolis University - Currently a Masters Degree in MSIT Software Engineering."},{"match":"English","label":"LANGUAGE","sentence":"Languages:Arabic (Native), English (Fluent), Japanese (beginner)"},{"match":"www.moofiyTv.com","label":"Links","sentence":"www.moofiyTv.com"},{"match":"muwaffaqimam@gmail.com","label":"emails","sentence":"muwaffaqimam@gmail.com"}]';
  
  String mockResponse3 =
      '[{"match":"Python","label":"CsSkill","sentence":""},{"match":"Numpy","label":"CsSkill","sentence":""},{"match":"Innopolis University","label":"ORG","sentence":"BSC from Innopolis University"},{"match":"English","label":"LANGUAGE","sentence":"Languages:Russian (Native), English (Fluent), French (beginner)"},{"match":"github.com/luciferlucy","label":"Links","sentence":"github.com/luciferlucy"},{"match":"luciferlucy@gmail.com","label":"emails","sentence":"luciferlucy@outlook.com"}]';

  String mockResponse4 =
      '[{"match":"Unity","label":"CsSkill","sentence":""},{"match":"Kinematics","label":"CsSkill","sentence":""},{"match":"MIT","label":"ORG","sentence":"MIT"},{"match":"English","label":"LANGUAGE","sentence":"Languages:English (Fluent), French (beginner)"},{"match":"github.com/csdojo","label":"Links","sentence":"github.com/csdojo"},{"match":"csdojo@gmail.com","label":"emails","sentence":"csdojo@hotmail.com"}]';

  mockResponses.add(mockResponse1);
  mockResponses.add(mockResponse2);
  mockResponses.add(mockResponse3);
  mockResponses.add(mockResponse4);
  
  return mockResponses[randomNumber];
}

Future<void> parseFile(PdfFile file) async {
  //Load the PDF document.
  // final List<dynamic> file = await getFileBytes();
  final String fileName = file.name;
  final PdfDocument document = PdfDocument(inputBytes: file.bytes as Uint8List);

  //Create PDF text extractor to extract text.
  final PdfTextExtractor extractor = PdfTextExtractor(document);

  //Extract text.
  final String text = extractor.extractText();

  //Dispose the document.
  document.dispose();

  //Convert text to json.
  var json = await mockAPI(text);

  //save the text to local storage
  save(fileName, json);
}


// Future<void> parseFiles() async {
//   //Load the PDF document.
//   final List<PdfFile> files = await getFilesBytes();

//   for (int i = 0; i < files.length; i++) {
//     final String fileName = files[i].name;
//     final PdfDocument document = PdfDocument(inputBytes: files[i].bytes);

//     //Create PDF text extractor to extract text.
//     final PdfTextExtractor extractor = PdfTextExtractor(document);

//     //Extract text.
//     final String text = extractor.extractText();

//     //Dispose the document.
//     document.dispose();

//     //save the text to local storage
//     var json = await mockAPI(text);
//     // var all = loadAll();
//     save(fileName, json);
//   }
// }
