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
      String api = await mockAPI("text");
      //String testApi = api;
      expect(api, '[{"match":"research","label":"CsSkill","sentence":""},{"match":"Innopolis University - Phd","label":"ORG","sentence":"Innopolis University - Currently a Masters Degree in MSIT Software Engineering."},{"match":"English","label":"LANGUAGE","sentence":"Languages:Arabic (Native), English (Fluent), Japanese (beginner)"},{"match":"www.moofiyTv.com","label":"Links","sentence":"www.moofiyTv.com"},{"match":"muwaffaqimam@gmail.com","label":"emails","sentence":"muwaffaqimam@gmail.com"}]');
    });
    /*
    test('Multiple files should be uploaded.', () async{
      final List<PdfFile> files =
      await getFilesBytes();
      expect(files[0].name, "Doc1");
    });

     */
    test('Load file', () {
      String? value = load('Doc1');
      expect(value, null);
    });

    test('Load multiple files', () {
      HashMap value = loadAll();
      for(int i = 0; i < value.length; i++)
      {
        print(value[i]);
      }
      expect(value, {});
    });
  });
}