import 'package:cv_parser/pages/ParsedInformationScreen.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

// TO-DO:
// 1. fix history-decker alignments:
//      a. the icon-button
//      b. stacking them in the row
//      c. fix scroll bar

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                              child: const Text("Contact",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xff894621),
                                      fontFamily: 'Merriweather'))),
                          TextButton(
                              onPressed: () {},
                              child: const Text("About",
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
                padding: EdgeInsets.fromLTRB(350, 0, 350, 0),
                color: Color(0xff864921),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "iExtract : Automate Resume Parsing using the Power of AI",
                      style: TextStyle(
                          fontSize: 52,
                          color: Colors.white,
                          fontFamily: 'Eczar',
                          fontWeight: FontWeight.w700),
                      textAlign: TextAlign.center,
                    ),
                    const Text(
                      "iExtract uses NLP (Natural Language Processing) to extract more than 10 fields from each resume, organizing them into searchable file formats.",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontFamily: 'Merriweather'),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              // Middle Container
              Container(
                height: 300,
                width: MediaQuery.of(context).size.width,
                color: Color(0xffE8E8E8),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 232,
                        width: 867,
                        color: Color(0xffFBFDF7),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              "Parse Resumes",
                              style: TextStyle(
                                fontSize: 48,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                                fontFamily: 'Eczar',
                              ),
                              textAlign: TextAlign.center,
                            ),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xff4D6658),
                                  onPrimary: Colors.white,
                                  textStyle: TextStyle(fontSize: 16),
                                  minimumSize: Size(60, 50),
                                  elevation: 10,
                                ),
                                onPressed: () {
                                  Navigator.push(context, 
                                  MaterialPageRoute(builder: (context) => const ParsedInformationScreen())
                                  );
                                },
                                child: const Text("Add Resumes (CVs)",
                                    style: TextStyle(
                                        fontFamily: 'Eczar',
                                        fontWeight: FontWeight.w700)))
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),

              // History-Deck
              Container(
                color: Color(0xffE9F1E8),
                padding: EdgeInsets.all(8),
                height: 209,
                width: 1040,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Transform.rotate(
                      angle: 180 * math.pi / 180,
                      child: IconButton(
                        onPressed: () {
                          
                        },
                        icon: Icon(
                          Icons.start,
                          size: 25,
                          color: Color(0xff864921),
                          // textDirection: TextDirection.rtl,
                        ),
                      ),
                    ),

                    // ************************** //
                    // Resume Containers //
                    Container(
                      width: 800,
                      child: Scrollbar(
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                                Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  // Jacob Jones
                                  Container(
                                    padding: EdgeInsets.fromLTRB(8, 8, 8, 10),
                                    margin: EdgeInsets.all(10),
                                    color: Color(0xffF2EEE1),
                                    height: 164,
                                    width: 148,
                                    child: Stack(
                                      children: [
                                        // top cross icon
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: Icon(Icons.close,
                                              size: 20, color: Color(0xff864921)),
                                        ),

                                        // center-document icon
                                        Align(
                                          alignment: Alignment.center,
                                          child: Icon(
                                            Icons.description,
                                            size: 70,
                                            color: Color(0xff4D6658),
                                          ),
                                        ),

                                        // Bottom-text

                                        Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Text("Jacob Jones",
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontFamily: 'Archivo',
                                                    fontWeight:
                                                        FontWeight.bold))),
                                      ],
                                    ),
                                  ),

                                  // Albert Flores
                                  Container(
                                    padding: EdgeInsets.fromLTRB(8, 8, 8, 10),
                                    margin: EdgeInsets.all(10),
                                    color: Color(0xffF2EEE1),
                                    height: 164,
                                    width: 148,
                                    child: Stack(
                                      children: [
                                        // top cross icon
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: Icon(Icons.close,
                                              size: 20, color: Color(0xff864921)),
                                        ),

                                        // center-document icon
                                        Align(
                                          alignment: Alignment.center,
                                          child: Icon(
                                            Icons.description,
                                            size: 70,
                                            color: Color(0xff4D6658),
                                          ),
                                        ),

                                        // Bottom-text

                                        Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Text("Albert Flores",
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontFamily: 'Archivo',
                                                    fontWeight:
                                                        FontWeight.bold))),
                                      ],
                                    ),
                                  ),

                                  // Devon Lane
                                  Container(
                                    padding: EdgeInsets.fromLTRB(8, 8, 8, 10),
                                    margin: EdgeInsets.all(10),
                                    color: Color(0xffF2EEE1),
                                    height: 164,
                                    width: 148,
                                    child: Stack(
                                      children: [
                                        // top cross icon
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: Icon(Icons.close,
                                              size: 20, color: Color(0xff864921)),
                                        ),

                                        // center-document icon
                                        Align(
                                          alignment: Alignment.center,
                                          child: Icon(
                                            Icons.description,
                                            size: 70,
                                            color: Color(0xff4D6658),
                                          ),
                                        ),

                                        // Bottom-text

                                        Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Text("Devon Lane",
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontFamily: 'Archivo',
                                                    fontWeight:
                                                        FontWeight.bold))),
                                      ],
                                    ),
                                  ),

                                  // Cameron Williamson
                                  Container(
                                    padding: EdgeInsets.fromLTRB(8, 8, 8, 10),
                                    margin: EdgeInsets.all(10),
                                    color: Color(0xffF2EEE1),
                                    height: 164,
                                    width: 148,
                                    child: Stack(
                                      children: [
                                        // top cross icon
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: Icon(Icons.close,
                                              size: 20, color: Color(0xff864921)),
                                        ),

                                        // center-document icon
                                        Align(
                                          alignment: Alignment.center,
                                          child: Icon(
                                            Icons.description,
                                            size: 70,
                                            color: Color(0xff4D6658),
                                          ),
                                        ),

                                        // Bottom-text

                                        Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Text("Cameron Williamson",
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontFamily: 'Archivo',
                                                    fontWeight:
                                                        FontWeight.bold))),
                                      ],
                                    ),
                                  ),

                                  // Aditya Singh
                                  Container(
                                    padding: EdgeInsets.fromLTRB(8, 8, 8, 10),
                                    margin: EdgeInsets.all(10),
                                    color: Color(0xffF2EEE1),
                                    height: 164,
                                    width: 148,
                                    child: Stack(
                                      children: [
                                        // top cross icon
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: Icon(Icons.close,
                                              size: 20, color: Color(0xff864921)),
                                        ),

                                        // center-document icon
                                        Align(
                                          alignment: Alignment.center,
                                          child: Icon(
                                            Icons.description,
                                            size: 70,
                                            color: Color(0xff4D6658),
                                          ),
                                        ),

                                        // Bottom-text

                                        Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Text("Aditya Singh",
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontFamily: 'Archivo',
                                                    fontWeight:
                                                        FontWeight.bold))),
                                      ],
                                    ),
                                  ),

                                  // Dwight Schrute
                                  Container(
                                    padding: EdgeInsets.fromLTRB(8, 8, 8, 10),
                                    margin: EdgeInsets.all(10),
                                    color: Color(0xffF2EEE1),
                                    height: 164,
                                    width: 148,
                                    child: Stack(
                                      children: [
                                        // top cross icon
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: Icon(Icons.close,
                                              size: 20, color: Color(0xff864921)),
                                        ),

                                        // center-document icon
                                        Align(
                                          alignment: Alignment.center,
                                          child: Icon(
                                            Icons.description,
                                            size: 70,
                                            color: Color(0xff4D6658),
                                          ),
                                        ),

                                        // Bottom-text

                                        Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Text("Dwight Schrute",
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontFamily: 'Archivo',
                                                    fontWeight:
                                                        FontWeight.bold))),
                                      ],
                                    ),
                                  ),

                                  // Michael Scott
                                  Container(
                                    padding: EdgeInsets.fromLTRB(8, 8, 8, 10),
                                    margin: EdgeInsets.all(10),
                                    color: Color(0xffF2EEE1),
                                    height: 164,
                                    width: 148,
                                    child: Stack(
                                      children: [
                                        // top cross icon
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: Icon(Icons.close,
                                              size: 20, color: Color(0xff864921)),
                                        ),

                                        // center-document icon
                                        Align(
                                          alignment: Alignment.center,
                                          child: Icon(
                                            Icons.description,
                                            size: 70,
                                            color: Color(0xff4D6658),
                                          ),
                                        ),

                                        // Bottom-text

                                        Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Text("Michael Scott",
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontFamily: 'Archivo',
                                                    fontWeight:
                                                        FontWeight.bold))),
                                      ],
                                    ),
                                  ),
                                ]),
                              ],
                        ),
                      ),
                    ),

                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.start,
                        size: 25,
                        color: Color(0xff864921),
                        // textDirection: TextDirection.rtl,
                      ),
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
