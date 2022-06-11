import 'package:cv_parser/pages/HomeScreen.dart';
import 'package:cv_parser/pages/ParsedInformationScreen.dart'; 
import 'package:cv_parser/pages/AboutScreen.dart';
import 'package:cv_parser/pages/ContactScreen.dart';
import 'package:flutter/material.dart';

void main() {
  // The runApp() function will take the root widget
  // as the parameter.
  runApp(const IExtract());
}

class IExtract extends StatelessWidget {
  const IExtract({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // the title of the web-app.
      title: 'iExtract - Resume Parser',

      // HomeScreen
      home: HomeScreen(),
    );
  }
}
