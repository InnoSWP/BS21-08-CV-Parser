import 'package:cv_parser/pages/ParsedInformationScreen.dart';
import 'package:cv_parser/pages/AboutScreen.dart';
import 'package:cv_parser/pages/ContactScreen.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xffE8E8E8),
          child: Column(
            children: [
              
              // Nav-Bar
              Container(
                padding: EdgeInsets.fromLTRB(70, 8, 70, 8),
                color: Color(0xffFFFFFF),
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Title of the Navbar
                    Container(
                      child: Row(children: [
                        Icon(
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
                          TextButton(
                              onPressed: () {},
                              child: const Text("Home",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xff894621),
                                    fontFamily: 'Merriweather',
                                  ))),
                          TextButton(
                              onPressed: () {},
                              child: const Text("About",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xff894621),
                                      fontFamily: 'Merriweather'))),
                          TextButton(
                              onPressed: () {},
                              child: const Text("Contact",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xff894621),
                                      fontFamily: 'Merriweather'))),
                         
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
                padding: EdgeInsets.fromLTRB(10, 100, 10, 100),
                color: Color(0xff864921),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "About",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontFamily: 'Eczar',
                          fontWeight: FontWeight.w700),
                      textAlign: TextAlign.center,
                    ),
                    const Text(
                      "Home / About ",
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
                height: 417,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.fromLTRB(10, 100, 10, 100), 
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "CV Parser Your AI Asistant",
                      style: TextStyle(
                          fontSize: 50,
                          color: Color(0xff4D6658),
                          fontFamily: 'Eczar',
                          fontWeight: FontWeight.w700),
                      textAlign: TextAlign.center,
                    ),
                    const Text(
                      "Cv Parser is my name At your fingertips, available 24 hours a day, \n 7 Days a week, whenever you need me. Resumes are something I \n Love eating. So, as a thank you, I will offer you with Json files of \n the Resimes If you gift me Resumes.",
                      style: TextStyle(
                          fontSize: 18,
                          color: Color(0xff4D6658),
                          fontFamily: 'Eczar'),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              

              // Blank Rectangle
              Container(
                height: 38,
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
                        fontFamily: 'Archivo',)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
