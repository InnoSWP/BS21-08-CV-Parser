import 'dart:collection';
import 'dart:convert';
import 'dart:html';
import 'dart:io';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:cv_parser/pages/AboutScreen.dart';
import 'package:cv_parser/pages/ContactScreen.dart';
import 'package:cv_parser/pages/HomeScreen.dart';
import 'package:cv_parser/pages/PdfFile.dart';
import 'package:cv_parser/pages/ResumeCards.dart';
import 'package:cv_parser/pages/parse_pdf.dart';
import 'package:cv_parser/scripts/local_storage.dart';
import 'package:universal_html/html.dart';

ResumeCards requestedResumeFromHomeScreen =
    new ResumeCards(name: "blank", parsed: false);

List<PdfFile> newFiles = [];

class ParsedInformationScreen extends StatefulWidget {
  static PageRouteBuilder getRoute() {
    return PageRouteBuilder(pageBuilder: (_, __, ___) {
      return ParsedInformationScreen();
    });
  }

  static void showResumes(ResumeCards resume) {
    requestedResumeFromHomeScreen = resume;
  }

  static void addFiles(List<PdfFile> files) {
    newFiles = files;
  }

  const ParsedInformationScreen({Key? key}) : super(key: key);

  @override
  State<ParsedInformationScreen> createState() =>
      _ParsedInformationScreenState();
}

class _ParsedInformationScreenState extends State<ParsedInformationScreen> {
  final searchController = TextEditingController();

  ResumeCards currentResume = new ResumeCards(name: "blank", parsed: true);
  List<ResumeCards> items = [];
  List<ResumeCards> showingItems = [];

  bool load = true;

  int count = 0;

  bool informationVisible = false;
  bool selectedResume = true;

  void initState() {
    super.initState();
    if (load) {
      resumeListSetter();
      newFilesAdder();
      if (requestedResumeFromHomeScreen.name != "blank") {
        informationVisible = true;
        showResume(requestedResumeFromHomeScreen);
        requestedResumeFromHomeScreen =
            new ResumeCards(name: "blank", parsed: true);
      }
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (newFiles.isNotEmpty && load) {
          load = false;
          fileLoader();
        }
      });
    }
  }

  Future<void> fileLoader() async {
    for (int i = 0; i < newFiles.length; i++) {
      parseFile(newFiles[i]);

      for (int j = 0; j < items.length; j++) {
        if (items[j].name == newFiles[i].name) {
          // now their parsed value is true.
          // but that doesn't mean that their JSONs
          // are parsed.
          // so after this we have to call the
          // resumelistsetter for the last time.
          items[j].parsed = true;
          showingItems[j].parsed = true;
        }
      }

      // newFiles.removeAt(i);
      await Future.delayed(const Duration(seconds: 0), () {
        setState(() {
        });
      });
    }

    setState(() {
      // because of new file adder,
      // the list contains some files which are not parsed
      // so we will clear both the lists and setup the resumeList again.
      // and hence we are done here.
      items.clear();
      showingItems.clear();
      newFiles.clear();
      resumeListSetter();
    });
  }

  Future<void> newFilesAdder() async {
    for (int i = 0; i < newFiles.length; i++) {
      // the parsed value is false
      // which means they are not parsed yet.
      items.add(new ResumeCards(name: newFiles[i].name, parsed: false));
      showingItems.add(new ResumeCards(name: newFiles[i].name, parsed: false));
    }
  }

  Future<void> resumeListSetter() async {
    HashMap<String, String> informationList = loadAll();
    Iterable<String> resumeNames = informationList.keys;
    for (int i = 0; i < resumeNames.length; i++) {
      items.add(new ResumeCards(name: resumeNames.elementAt(i), parsed: true));
      showingItems
          .add(new ResumeCards(name: resumeNames.elementAt(i), parsed: true));
    }
  }

  String personName = "";
  String personPhoneNumber = "";
  String personEmail = "";
  String personUserName = "";
  String personTelegramID = "";

  double expandedHeight = 202;
  double closedHeight = 52;

  List<String> currentList = [];

  List<String> SkillsItems = [];

  List<String> OrganizationsItems = [];

  List<String> LanguagesItems = [];

  List<String> CountriesItems = [];

  List<String> PublicationsItems = [];

  List<String> LinksItems = [];

  List<AnimatedContainer> parsedInformationDecks = [];

  List<bool> visiblitiyValues = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  List<bool> visibilityContainers = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  List<double> heightValues = [52, 52, 52, 52, 52, 52, 52, 52, 52];

  List<double> angleValues = [270, 270, 270, 270, 270, 270, 270, 270, 270];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // NavBar

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
                          "CV Parser",
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
                              onPressed: () {
                                Navigator.push(context, HomeScreen.getRoute());
                              },
                              child: const Text("Home",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xff894621),
                                    fontFamily: 'Merriweather',
                                  ))),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context, ContactScreen.getRoute());
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

              // Mid-Part
              Container(
                // height: 1100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [

                        Visibility(
                          visible: selectedResume,
                          child: Container(
                            height: 1000,
                            width: 900,
                              alignment: Alignment.center,
                              child: Column(children: [
                                Icon(Icons.ads_click, size: 100),
                                Text("Select a resume to view information.", style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 32,
                                )),
                              ])),
                        ),

                        // Information-Section
                        Visibility(
                          visible: informationVisible,
                          child: Container(
                            color: Colors.white,
                            padding: EdgeInsets.fromLTRB(64, 27, 32, 36),
                            width: 0.6 * MediaQuery.of(context).size.width,
                            child: Visibility(
                              visible: informationVisible,
                              child: Column(
                                children: [
                                  // Top-Heading
                                  Align(
                                      // alignment: Alignment.center,
                                      child: Text("Parsed Information",
                                          style: TextStyle(
                                              color: Color(0xff7A370B),
                                              fontSize: 30,
                                              fontFamily: 'Eczar',
                                              fontWeight: FontWeight.w700))),
                        
                                  // Basic-Information-Container
                                  Container(
                                    width: 900,
                                    height: 169,
                                    child: Row(
                                      children: [
                                        // top-basic-information
                                        Container(
                                          padding:
                                              EdgeInsets.fromLTRB(21, 8, 22, 21),
                                          width: 621,
                                          height: 169,
                                          decoration: BoxDecoration(
                                              color: Color(0xffF2EEE1),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                          child: Column(
                                            children: [
                                              // Name of Person
                                              Container(
                                                  padding: EdgeInsets.fromLTRB(
                                                      12, 7, 84, 8),
                                                  margin: EdgeInsets.all(5),
                                                  width: 575,
                                                  height: 43,
                                                  decoration: BoxDecoration(
                                                      color: Color(0xffFBFDF7),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10))),
                                                  child: Text(
                                                    personName,
                                                    style: TextStyle(
                                                        fontFamily:
                                                            'Merriweather',
                                                        fontSize: 24),
                                                  )),
                        
                                              // information
                                              Row(
                                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  // Information 1
                                                  Container(
                                                    margin: EdgeInsets.all(10),
                                                    width: 300,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        // Email-ID
                                                        Container(
                                                          child: Row(
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .alternate_email,
                                                                size: 22,
                                                              ),
                                                              Text("  "),
                                                              Text(
                                                                personEmail,
                                                                style: TextStyle(
                                                                  fontFamily:
                                                                      'Merriweather',
                                                                  fontSize: 16,
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                        
                                        Container(
                                          width: 12,
                                          height: 169,
                                        ),
                        
                                        // profile-photo
                                        Container(
                                          width: 172,
                                          height: 169,
                                          decoration: BoxDecoration(
                                              color: Color(0xffF2EEE1),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(7.0))),
                                          child: Icon(
                                              Icons.account_circle_outlined,
                                              size: 120,
                                              color: Color(0xff7A370B)),
                                        ),
                                      ],
                                    ),
                                  ),
                        
                                  // Parsed-Information-Display Section
                                  Container(
                                    width: 900,
                                    height: 800,
                                    margin: EdgeInsets.only(top: 30),
                                    color: Colors.white,
                                    child: SingleChildScrollView(
                                      child: Wrap(
                                        direction: Axis.vertical,
                                        children: [
                                          getParsedInformationContainer("Skills"),
                                          getParsedInformationContainer("Organizations"),
                                          getParsedInformationContainer("Languages"),
                                          getParsedInformationContainer("Countries"),
                                          getParsedInformationContainer("NORP"),
                                          getParsedInformationContainer("GPE"),
                                          getParsedInformationContainer("Degree"),
                                          getParsedInformationContainer("Publications"),
                                          getParsedInformationContainer("Links"),
                                        ],
                                      ),
                                    ),
                                  ),
                        
                                  Container(
                                            height: 100,
                                          ),
                        
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Color(0xff4D6658),
                                        onPrimary: Colors.white,
                                        textStyle: TextStyle(fontSize: 16),
                                        minimumSize: Size(291, 45),
                                        elevation: 10,
                                      ),
                                      onPressed: () {
                                        exportAsCSV();
                                      },
                                      child: Text(
                                        "Export CV",
                                        style: TextStyle(
                                            fontFamily: 'Eczar', fontSize: 15),
                                      ))
                                ],
                              ),
                            ),
                          ),
                        ),

                        // Resumes-List
                        Expanded(
                          child: Container(
                            color: Color(0xffFbFdF7),
                            height: 1252,
                            width: 590,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Resume-List Header
                                Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xffFbFdF7),
                                  ),
                                  height: 85,
                                  width: 650,
                                  child: Column(
                                    // mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Resumes List",
                                        style: TextStyle(
                                            fontFamily: 'Eczar',
                                            fontSize: 32,
                                            color: Color(0xff7A370B)),
                                      ),
                                      Text(
                                        "Click on a particular CV to extract information.",
                                        style: TextStyle(
                                            fontFamily: 'Merriweather',
                                            fontSize: 15,
                                            color: Color(0xff4D6658)),
                                      ),
                                    ],
                                  ),
                                ),

                                // Search Bar
                                Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                        width: 470,
                                        height: 40,
                                        margin: EdgeInsets.all(20),
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: Color(0xffFEFDFE),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey,
                                              offset:
                                                  Offset(0.0, 1.0), // (x, y)
                                              blurRadius: 6.0,
                                            )
                                          ],
                                        ),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              // TextField
                                              Container(
                                                width: 400,
                                                height: 20,
                                                child: TextField(
                                                  controller: searchController,
                                                  style: TextStyle(
                                                    // height: 3.0,
                                                    fontFamily: 'Merriweather',
                                                    fontSize: 14,
                                                  ),
                                                  decoration: InputDecoration(
                                                    contentPadding:
                                                        EdgeInsets.all(5),
                                                    // suffixIcon: Icon(Icons.search_off_outlined, size: 30, color: Color(0xff864921),),
                                                    // filled: true,
                                                    hintText: "Search CVs....",
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide:
                                                          const BorderSide(
                                                              width: 0,
                                                              color: Color(
                                                                  0xffFEFDFE)),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide:
                                                          const BorderSide(
                                                              width: 0,
                                                              color: Color(
                                                                  0xffFEFDFE)),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                  ),
                                                ),
                                              ),

                                              InkWell(
                                                onTap: () {
                                                  String query =
                                                      searchController.text;
                                                  if (query == "") {
                                                    showingItems =
                                                        items.sublist(
                                                            0, items.length);
                                                  } else {
                                                    showingItems.clear();
                                                    for (int i = 0;
                                                        i < items.length;
                                                        i++) {
                                                      ResumeCards currentCard =
                                                          items[i];
                                                      for (int j = 0;
                                                          j <
                                                              currentCard
                                                                  .jsonList
                                                                  .length;
                                                          j++) {
                                                        String matching =
                                                            currentCard
                                                                .jsonList[j]
                                                                    ["match"]
                                                                .toString()
                                                                .toLowerCase();
                                                        query =
                                                            query.toLowerCase();
                                                        if (matching
                                                            .contains(query)) {
                                                          showingItems
                                                              .add(currentCard);
                                                          break;
                                                        }
                                                      }
                                                    }
                                                  }

                                                  setState(() {});
                                                },
                                                child: Icon(
                                                  Icons.search_outlined,
                                                  size: 20,
                                                  color: Color(0xff864921),
                                                ),
                                              )
                                            ]))),

                                // Resumes-List-Containing-Container
                                // Container(
                                //     padding: EdgeInsets.all(16),
                                //     height: 750,
                                //     width: 600,
                                //     // color: Colors.blue,
                                //     child: SingleChildScrollView(
                                //       child: Wrap(
                                //         direction: Axis.horizontal,
                                //         children: List.generate(
                                //             showingItems.length, (index) {
                                //           return buildCard(showingItems[index]);
                                //         }),
                                //       ),
                                //     )),

                                Align(
                                    alignment: Alignment.center,
                                    child: resumeList()),

                                // Bottom-Buttons
                                Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            primary: Color(0xffE9F1E8),
                                            onPrimary: Color(0xff4D6658),
                                            textStyle: TextStyle(fontSize: 15),
                                            minimumSize: Size(164, 45),
                                            elevation: 10,
                                          ),
                                          onPressed: () {
                                            exportMulitpleResumes();
                                          },
                                          child: Text(
                                            "Export Multiple CVs",
                                            style: TextStyle(
                                                fontFamily: 'Eczar',
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          )),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      // ElevatedButton(
                                      //     style: ElevatedButton.styleFrom(
                                      //       primary: Color(0xff4D6658),
                                      //       onPrimary: Colors.white,
                                      //       textStyle: TextStyle(fontSize: 15),
                                      //       minimumSize: Size(164, 45),
                                      //       elevation: 10,
                                      //     ),
                                      //     onPressed: () {},
                                      //     child: Text(
                                      //       "Add Resumes (CVs)",
                                      //       style: TextStyle(
                                      //           fontFamily: 'Eczar',
                                      //           fontSize: 15,
                                      //           fontWeight: FontWeight.bold),
                                      //     )),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
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
        margin: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Color(0xffF2EEE1),
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0), // (x, y)
              blurRadius: 3.0,
            )
          ],
        ),
        height: 164,
        width: 148,
        child: Stack(
          children: [
            // top cross icon
            Align(
              alignment: Alignment.topRight,
              child: InkWell(
                  onTap: () {
                    remove(resume.name);

                    items.remove(resume);
                    showingItems.remove(resume);

                    Future.delayed(const Duration(milliseconds: 0), () {
                      setState(() {
                        // resumeListSetter();
                      });
                    });
                  },
                  child: Icon(Icons.close, size: 20, color: Color(0xff864921))),
            ),

            // center-document icon
            resumeIcon(resume),

            // Bottom-text

            Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  resume.name,
                  style: TextStyle(
                      fontSize: 13,
                      fontFamily: 'Archivo',
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                )),
          ],
        ),
      );

  void showResume(ResumeCards resume) {
    currentResume = resume;
    personName = resume.name;
    personEmail = resume.email;

    SkillsItems = resume.skillItems;
    OrganizationsItems = resume.organizationItems;
    LanguagesItems = resume.languagesItems;
    CountriesItems = resume.countriesItems;
    PublicationsItems = resume.publicationsItems;
    LinksItems = resume.linksItems;
    setState(() {});
  }

  Widget buildDeck(String name) => Container(
        // margin: EdgeInsets.all(5),
        width: 800,
        height: 52,
        padding: EdgeInsets.fromLTRB(26.93, 5, 21, 5),
        decoration: BoxDecoration(
            color: Color(0xffE9F1E8),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            name,
            style: TextStyle(fontFamily: 'Eczar', fontSize: 24),
          ),
          Transform.rotate(
            angle: angleValues[getIndexByName(name)] * math.pi / 180,
            child: IconButton(
              onPressed: () {

                int prevIndex = visiblitiyValues.indexOf(true);
                int currentIndex = getIndexByName(name);

                bool newAnimation = false;

                if (prevIndex != -1) {
                  if (prevIndex != currentIndex) {
                    heightValues[prevIndex] = closedHeight;
                    visiblitiyValues[prevIndex] = false;
                    angleValues[prevIndex] = 270;
                    newAnimation = true;
                  }
                } else {
                  newAnimation = true;
                }

                if (newAnimation) {
                  heightValues[currentIndex] = expandedHeight;
                  visiblitiyValues[currentIndex] = true;
                  angleValues[currentIndex] = 0;
                } else {
                  heightValues[currentIndex] = closedHeight;
                  visiblitiyValues[currentIndex] = false;
                  angleValues[currentIndex] = 270;
                }
                setState(() {});
              },
              icon: Icon(
                Icons.arrow_drop_down,
                size: 30,
                color: Color(0xff864921),
                // textDirection: TextDirection.rtl,
              ),
            ),
          ),
        ]),
      );
  TextEditingController reportValue = new TextEditingController();
  String report = '';
  Widget buildExpandedContainer(List<String> currentList, String name) =>
      Container(
        padding: EdgeInsets.fromLTRB(33, 15, 120, 10),
        height: 150,
        width: 800,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          color: Color(0xffF2EEE1),
        ),
        child: SingleChildScrollView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(currentList.length, (index) {
            String result =
                ((index + 1).toString() + '. ' + currentList[index]);

            return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    result,
                    style: TextStyle(fontFamily: 'Merriweather', fontSize: 16),
                  ),
                  InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('Wrong information!'),
                            content: const Text(
                                'Please, report here what is wrong with the data listed.'),
                            actions: <Widget>[
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    16.0, 0.0, 16.0, 8.0),
                                child: TextField(
                                  decoration: InputDecoration(
                                      hintText: 'Enter your report'),
                                  controller: reportValue,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  report =
                                      '{"match": "research","label": "CsSkill","sentence": """reason": "' +
                                          reportValue.text +
                                          '"}';
                                  //final body = jsonDecode(report);
                                  // print(report + '\n');
                                  Navigator.pop(context, 'Submit');
                                },
                                child: const Text('Submit'),
                              ),
                            ],
                          ),
                        );
                        for (int i = 0; i < items.length; i++) {
                          if (items[i].name == currentResume.name) {
                            for (int j = 0; j < items[i].jsonList.length; j++) {
                              if (items[i].jsonList[j]["match"] ==
                                      currentList[index] &&
                                  items[i].jsonList[j]["label"] ==
                                      getJSONLabel(name)) {
                                // print(i);
                                items[i].jsonList.removeAt(j);
                                // print(currentResume.jsonList[i]["label"]);
                              }
                            }

                            // After removing the item from the resume,
                            // the current list in container which is used
                            // to display the result needs to be reset.
                            // Can be cleared, and the resume can be parsed from the modified JSON.

                            currentList.clear();
                            items[i].parsingData();
                          }
                        }

                        Future.delayed(const Duration(milliseconds: 1000), () {
                          // print(currentResume.skillItems);
                          setState(() {
                            // resumeListSetter();
                          });
                        });
                      },
                      child:
                          Icon(Icons.close, size: 20, color: Color(0xff864921)))
                ]);
          }),
        )),
      );

  List<String> getCurrentList(String name) {
    for (int i = 0; i < items.length; i++) {
      if (currentResume.name == items[i].name) {
        switch (name) {
          case 'Skills':
            return items[i].skillItems;
          case 'Organizations':
            return items[i].organizationItems;
          case 'Languages':
            return items[i].languagesItems;
          case 'Countries':
            return items[i].countriesItems;
          case 'Publications':
            return items[i].publicationsItems;
          case 'Links':
            return items[i].linksItems;
          case "GPE":
            return items[i].gpeItems;
          case "Degree":
            return items[i].degreeItems;
          case "NORP":
            return items[i].norpItems;
          default:
            return items[i].skillItems;
        }
      }
    }
    return currentResume.skillItems;
  }

  AnimatedContainer getParsedInformationContainer(String name) => AnimatedContainer(
        width: 800,
        height: heightValues[getIndexByName(name)],
        margin: EdgeInsets.all(10),
        duration: Duration(seconds: 0),
        child: Column(
          children: [
            buildDeck(name),
            Visibility(
              child: buildExpandedContainer(getCurrentList(name), name),
              visible: visiblitiyValues[getIndexByName(name)],
            ),
          ],
        ),
      );

  int getIndexByName(String name) {
    switch (name) {
      case 'Skills':
        return 0;
      case 'Organizations':
        return 1;
      case 'Languages':
        return 2;
      case 'Countries':
        return 3;
      case 'NORP':
        return 4;
      case 'GPE':
        return 5;
      case "Degree":
        return 6;
      case "Publications":
        return 7;
      case "Links":
        return 8;
      default:
        return 0;
    }
  }

  Widget resumeIcon(ResumeCards resume) {
    if (!resume.parsed) {
      return new CircularProgressIndicator();
    } else {
      return Align(
        alignment: Alignment.center,
        child: InkWell(
          child: Icon(
            Icons.description,
            size: 70,
            color: Color(0xff4D6658),
          ),
          onTap: () {

            selectedResume = false;
            informationVisible = true;
            showResume(resume);
          },
        ),
      );
    }
  }

  void exportMulitpleResumes() {
    for (int i = 0; i < showingItems.length; i++) {
      // List<List<dynamic>> rows = [];

      // print(showingItems[i].name);

      // String csv;
      String line = "";

      line += "Skills, ";
      for (int j = 0; j < showingItems[i].skillItems.length; j++) {
        line += showingItems[i].skillItems[j] + ", ";
      }
      line += "\n";

      line += "Organizations, ";
      for (int j = 0; j < showingItems[i].organizationItems.length; j++) {
        line += showingItems[i].organizationItems[j] + ", ";
      }
      line += "\n";

      line += "Languages, ";
      for (int j = 0; j < showingItems[i].languagesItems.length; j++) {
        line += showingItems[i].languagesItems[j] + ", ";
      }
      line += "\n";

      line += "Countries, ";
      for (int j = 0; j < showingItems[i].countriesItems.length; j++) {
        line += showingItems[i].countriesItems[j] + ", ";
      }
      line += "\n";

      line += "Publications, ";
      for (int j = 0; j < showingItems[i].publicationsItems.length; j++) {
        line += showingItems[i].publicationsItems[j] + ", ";
      }
      line += "\n";

      line += "Links, ";
      for (int j = 0; j < showingItems[i].linksItems.length; j++) {
        line += showingItems[i].linksItems[j] + ", ";
      }
      line += "\n";

      // String csv = const ListToCsvConverter().convert(rows);

      // print(line);

      // save(showingItems[i].name.toString() + " as CSV", line);

      csv_download(line, showingItems[i].name + ".csv");
    }
  }

  void exportAsCSV() {
    for (int i = 0; i < items.length; i++) {
      if (items[i].name == currentResume.name) {
        List<List<dynamic>> rows = [];

        // String csv;
        String line = "";

        line += "Skills, ";
        for (int j = 0; j < items[i].skillItems.length; j++) {
          line += items[i].skillItems[j] + ", ";
        }
        line += "\n";

        line += "Organizations, ";
        for (int j = 0; j < items[i].organizationItems.length; j++) {
          line += items[i].organizationItems[j] + ", ";
        }
        line += "\n";

        line += "Languages, ";
        for (int j = 0; j < items[i].languagesItems.length; j++) {
          line += items[i].languagesItems[j] + ", ";
        }
        line += "\n";

        line += "Countries, ";
        for (int j = 0; j < items[i].countriesItems.length; j++) {
          line += items[i].countriesItems[j] + ", ";
        }
        line += "\n";

        line += "NORP, ";
        for (int j = 0; j < items[i].norpItems.length; j++) {
          line += items[i].norpItems[j] + ", ";
        }
        line += "\n";

        line += "GPE, ";
        for (int j = 0; j < items[i].gpeItems.length; j++) {
          line += items[i].gpeItems[j] + ", ";
        }
        line += "\n";

        line += "Degree, ";
        for (int j = 0; j < items[i].degreeItems.length; j++) {
          line += items[i].degreeItems[j] + ", ";
        }
        line += "\n";

        line += "Publications, ";
        for (int j = 0; j < items[i].publicationsItems.length; j++) {
          line += items[i].publicationsItems[j] + ", ";
        }
        line += "\n";

        line += "Links, ";
        for (int j = 0; j < items[i].linksItems.length; j++) {
          line += items[i].linksItems[j] + ", ";
        }
        line += "\n";

        // String csv = const ListToCsvConverter().convert(rows);

        // save(items[i].name.toString() + " as CSV", line);

        csv_download(line, items[i].name + ".csv");
      }
    }
  }

  String getJSONLabel(String name) {
    switch (name) {
      case "Skills":
        return "CsSkill";
      case "Organizations":
        return "ORG";
      case "Languages":
        return "LANGUAGE";
      case "Links":
        return "Links";
      default:
        return "";
    }
  }

  void csv_download(String csv, String name) {
    AnchorElement(href: "data:text/plain;charset=utf-8,$csv")
      ..setAttribute("download", name)
      ..click();
  }

  Widget resumeList() {
    if (showingItems.length == 0) {
      return Container(
          height: 500,
          width: 600,
          child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.manage_search, size: 60),
                Text("Search matches no result."),
              ]));
    }
    return Container(
        padding: EdgeInsets.all(16),
        height: 750,
        width: 600,
        // color: Colors.blue,
        child: SingleChildScrollView(
          child: Wrap(
            direction: Axis.horizontal,
            children: List.generate(showingItems.length, (index) {
              return buildCard(showingItems[index]);
            }),
          ),
        ));
  }
}
