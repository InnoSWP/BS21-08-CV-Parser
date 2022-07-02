// Test 1 - Multiple CVs
import 'dart:collection';
import 'dart:convert';
import 'dart:math';

import 'package:cv_parser/pages/PdfFile.dart';
import 'package:cv_parser/pages/parse_pdf.dart';

import 'package:cv_parser/scripts/local_storage.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

 group('Testing group 1', () {
   test('Mock api', () async{
     print("Testing Mock api...");
     String api = await mockAPI("text");
     //String testApi = api;
     bool flag = true;
     List<String> matches = api.split('},{') as List<String>;
     matches[0] = matches[0].substring(2, matches[0].length);
     matches[matches.length - 1] = matches[matches.length - 1].substring(0, matches[matches.length - 1].length - 2);
     for(int i =  0; i < matches.length; i++)
       {
         if(!matches[i].startsWith('"match"') || !matches[i].contains('"label"') || !matches[i].contains('"sentence"')) flag = false;
       }
     expect(flag, true);
   });
   ///TODO we are working on using integration testing to test the file picker
   /*
   test('Multiple files should be uploaded.', () async{
     final List<PdfFile> files =
     await getFilesBytes();
     expect(files[0].name, "Doc1");
   });

    */
   test('Load file', () {
     print("Testing loading file...");
     String? value = load('Doc1');
     expect(value, null);
   });

   test('Load multiple files', () {
     print("Testing loading mulitple files...");
     HashMap value = loadAll();
     for(int i = 0; i < value.length; i++)
     {
       print(value[i]);
     }
     expect(value, {});
   });
 });
}


