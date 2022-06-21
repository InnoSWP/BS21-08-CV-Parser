import 'package:cv_parser/pages/HomeScreen.dart';
import 'package:cv_parser/pages/ParsedInformationScreen.dart';
import 'package:cv_parser/pages/AboutScreen.dart';
import 'package:cv_parser/pages/ContactScreen.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

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
      builder: (context, widget) => ResponsiveWrapper.builder(
        ClampingScrollWrapper.builder(context, widget!),
        breakpoints: const [
          ResponsiveBreakpoint.resize(350, name: MOBILE),
          ResponsiveBreakpoint.resize(600, name: TABLET),
          ResponsiveBreakpoint.resize(800, name: DESKTOP),
          ResponsiveBreakpoint.autoScaleDown(1700, name: "largeScreens"),
          ResponsiveBreakpoint.autoScale(2400, name: "extraLargeScreens"),
        ],
      ),
      debugShowCheckedModeBanner: false,

      // the title of the web-app.
      title: 'iExtract - Resume Parser',

      // HomeScreen
      home: HomeScreen(),
    );
  }
}
