import 'package:auto_size_text/auto_size_text.dart';
import 'package:cv_parser/pages/HomeScreen.dart';
import 'package:cv_parser/pages/ParsedInformationScreen.dart';
import 'package:cv_parser/pages/AboutScreen.dart';
import 'package:cv_parser/pages/ContactScreen.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'dart:math' as math;
import 'package:responsive_framework/responsive_wrapper.dart';

import '../Widgets/nav_drawer.dart';

class AboutScreen extends StatefulWidget {
  static PageRouteBuilder getRoute() {
    return PageRouteBuilder(pageBuilder: (_, __, ___) {
      return AboutScreen();
    });
  }

  const AboutScreen({Key? key}) : super(key: key);

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: ResponsiveVisibility(
          hiddenWhen: const [Condition.largerThan(name: TABLET)],
          child: NavigationDrawerWidget(),
        ),
        body: Builder(
          builder: (context) => SingleChildScrollView(
            child: Container(
              color: Color(0xffF8F8F8),
              child: Column(
                children: [
                  // Nav-Bar
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 8, 70, 8),
                    color: Color(0xffFFFFFF),
                    height: 70,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Title of the Navbar
                        Container(
                          child: Row(children: [
                            ResponsiveVisibility(
                                hiddenWhen: const [
                                  Condition.largerThan(name: TABLET)
                                ],
                                child: IconButton(
                                    onPressed: () {
                                      Scaffold.of(context).openDrawer();
                                    },
                                    icon: const Icon(Icons.menu))),
                            const Icon(
                              Icons.description,
                              size: 50,
                              color: Color(0xff864921),
                            ),
                            const Text(
                              "iExtract",
                              style: TextStyle(
                                fontSize: 36,
                                color: Color(0xff864921),
                                fontFamily: 'Eczar',
                                fontWeight: FontWeight.w700,
                              ),
                            )
                          ]),
                        ),

                        // Nav-Links
                        Container(
                          child: Row(
                            children: [
                              ResponsiveVisibility(
                                  visible: false,
                                  visibleWhen: [
                                    Condition.largerThan(name: TABLET)
                                  ],
                                  child: TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context, HomeScreen.getRoute());
                                      },
                                      child: const Text("Home",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Color(0xff894621),
                                            fontFamily: 'Merriweather',
                                          )))),
                              ResponsiveVisibility(
                                  visible: false,
                                  visibleWhen: [
                                    Condition.largerThan(name: TABLET)
                                  ],
                                  child: TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context, ContactScreen.getRoute());
                                      },
                                      child: const Text("Contact",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Color(0xff894621),
                                              fontFamily: 'Merriweather')))),
                              ResponsiveVisibility(
                                  visible: false,
                                  visibleWhen: [
                                    Condition.largerThan(name: TABLET)
                                  ],
                                  child: TextButton(
                                      onPressed: () {},
                                      child: const Text("About",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Color(0xff894621),
                                              fontFamily: 'Merriweather')))),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Top-Container
                  Container(
                    height: 290,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.fromLTRB(10, 60, 10, 0),
                    color: Color(0xff864921),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        AutoSizeText(
                          maxLines: 1,
                          "About",
                          style: TextStyle(
                              fontSize: 52,
                              color: Colors.white,
                              fontFamily: 'Eczar',
                              fontWeight: FontWeight.w700),
                          textAlign: TextAlign.center,
                        ),
                        AutoSizeText(
                          maxLines: 1,
                          "Home / About",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontFamily: 'Eczar'),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),

                  // Middle-Container
                  Container(
                    height: 600,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.fromLTRB(0, 60, 0, 40),
                    child: ResponsiveRowColumn(
                        rowMainAxisAlignment: MainAxisAlignment.center,
                        rowPadding: const EdgeInsets.all(30),
                        columnPadding: const EdgeInsets.all(30),
                        layout:
                            ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
                                ? ResponsiveRowColumnType.COLUMN
                                : ResponsiveRowColumnType.ROW,
                        children: [
                          ResponsiveRowColumnItem(
                              columnFlex: 1,
                              child: Container(
                                margin: EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 300,
                                      child: const AutoSizeText(
                                        maxLines: 1,
                                        "CV Parser Your AI Asistant",
                                        style: TextStyle(
                                            fontSize: 40,
                                            color: Color(0xff4D6658),
                                            fontFamily: 'Eczar',
                                            fontWeight: FontWeight.w600),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    const AutoSizeText(
                                      maxLines: 4,
                                      "Cv Parser is my name At your fingertips, available 24 hours a day, \n 7 Days a week, whenever you need me. Resumes are something I \n Love eating. So, as a thank you, I will offer you with Json files of \n the Resimes If you gift me Resumes.",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Color(0xff4D6658),
                                          fontFamily: 'Eczar'),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              )),
                          ResponsiveRowColumnItem(
                            columnFlex: 1,
                            child: Container(
                                margin: EdgeInsets.all(10),
                                child: Image.asset('images/about_image.jpg')),
                          )
                        ]),
                  ),

                  // Blank Rectangle
                  Container(
                    height: 5,
                  ),

                  // Footer
                  Container(
                    height: 58,
                    width: MediaQuery.of(context).size.width,
                    color: Color(0xffFbFDFE),
                    padding: EdgeInsets.fromLTRB(70, 20, 70, 10),
                    child: const Text("© iExtract 2022 - Your AI Assistant",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontFamily: 'Archivo',
                        )),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
