import 'package:cv_parser/pages/AboutScreen.dart';
import 'package:cv_parser/pages/ContactScreen.dart';
import 'package:cv_parser/pages/ParsedInformationScreen.dart';
import 'package:cv_parser/pages/parse_pdf.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class HomeScreen extends StatefulWidget {

  static PageRouteBuilder getRoute() {
    return PageRouteBuilder(pageBuilder: (_, __, ___) {
      return HomeScreen();
    });

  }
  
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class ResumeCards {
  final String name;

  const ResumeCards({
    required this.name,
  });
}

class _HomeScreenState extends State<HomeScreen> {
  
  List<ResumeCards> items = [
    ResumeCards(name: "Jacob Jones"),
    ResumeCards(name: "Albert Flores"),
    ResumeCards(name: "Devon Lane"),
    ResumeCards(name: "Cameron Williamson"),
    ResumeCards(name: "Aditya Singh"),
    ResumeCards(name: "Dwight Schrute"),
    ResumeCards(name: "Michael Scott"),
  ];

  List<ResumeCards> startItems = [];
  List<ResumeCards> endItems = [];

  int startIndex = 0;
  int endIndex = 4;

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
                              onPressed: () {
                                Navigator.push(context, ContactScreen.getRoute());
                              },
                              child: const Text("Contact",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xff894621),
                                      fontFamily: 'Merriweather'))),
                          TextButton(
                              onPressed: () {
                                Navigator.push(context, AboutScreen.getRoute());
                              },
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
                                  
                                  parseFile();
                                  
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const ParsedInformationScreen()));
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
                          if (startIndex > 0) {
                            items.insert(
                                0, startItems.elementAt(startIndex - 1));
                            startItems.removeAt(startIndex - 1);
                            startIndex--;
                            endIndex--;
                          }
                          setState(() {});
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
                      width: 900,
                      child: SizedBox(
                        height: 140,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          // mainAxisAlignment: MainAxisAlignment.start,
                          itemCount: items.length,
                          separatorBuilder: (context, index) {
                            return const SizedBox(width: 12);
                          },

                          itemBuilder: (BuildContext context, int index) {
                            return buildCard(items[index]);
                          },
                        ),
                      ),
                    ),

                    IconButton(
                      onPressed: () {
                        if (endIndex < items.length && items.length > 5) {
                          startItems.add(items.elementAt(0));
                          items.removeAt(0);
                          startIndex++;
                          endIndex++;
                        }
                        setState(() {});
                      },
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
                      fontFamily: 'Archivo',
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCard(ResumeCards resume) => Container(
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
              child: Icon(Icons.close, size: 20, color: Color(0xff864921)),
            ),

            // center-document icon
            Align(
              alignment: Alignment.center,
              child: InkWell(
                child: Icon(
                  Icons.description,
                  size: 70,
                  color: Color(0xff4D6658),
                ),
                onTap: () {},
              ),
            ),

            // Bottom-text

            Align(
                alignment: Alignment.bottomCenter,
                child: Text(resume.name,
                    style: TextStyle(
                        fontSize: 13,
                        fontFamily: 'Archivo',
                        fontWeight: FontWeight.bold))),
          ],
        ),
      );
}
