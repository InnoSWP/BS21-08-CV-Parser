import 'package:cv_parser/pages/AboutScreen.dart';
import 'package:cv_parser/pages/ContactScreen.dart';
import 'package:cv_parser/pages/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:math' as math;

class ParsedInformationScreen extends StatefulWidget {
  static PageRouteBuilder getRoute() {
    return PageRouteBuilder(pageBuilder: (_, __, ___) {
      return ParsedInformationScreen();
    });
  }

  const ParsedInformationScreen({Key? key}) : super(key: key);

  @override
  State<ParsedInformationScreen> createState() =>
      _ParsedInformationScreenState();
}

class _ParsedInformationScreenState extends State<ParsedInformationScreen> {
  // AnimationController? _controller;
  // Animation<double>? _animation;

  double expandedHeight = 152;
  double closedHeight = 52;

  List<String> currentList = [];

  List<ResumeCards> items = [
    ResumeCards(name: "Jacob Jones"),
    ResumeCards(name: "Albert Flores"),
    ResumeCards(name: "Devon Lane"),
    ResumeCards(name: "Cameron Williamson"),
    ResumeCards(name: "Aditya Singh"),
    ResumeCards(name: "Dwight Schrute"),
    ResumeCards(name: "Michael Scott"),
    ResumeCards(name: "Jim Halpert"),
    ResumeCards(name: "Pam Beesly"),
    ResumeCards(name: "Andy Bernard"),
    ResumeCards(name: "Kelly Kapoor"),
  ];

  List<String> SkillsItems = [
    "Active listening skills",
    "Communication Skills",
    "Java language"
  ];

  List<String> OrganizationsItems = [
    "Innopolis University",
    "Innopolis High School"
  ];

  List<String> LanguagesItems = ["Java", "C++", "DOT Net"];

  List<String> CountriesItems = ["Russia", "Ukraine", "America"];

  List<String> PublicationsItems = [
    "Penguin House Publications",
    "Hallen Publication"
  ];

  List<String> LinksItems = ["https://www.dambase.com/"];

  List<bool> visiblitiyValues = [false, false, false, false, false, false];

  List<double> heightValues = [52, 52, 52, 52, 52, 52];

  List<double> angleValues = [270, 270, 270, 270, 270, 270];

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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        // Information-Section
                        Container(
                          color: Color(0xffE8E8E8),
                          padding: EdgeInsets.fromLTRB(64, 27, 32, 36),
                          width: 0.6 * MediaQuery.of(context).size.width,
                          child: Column(
                            children: [
                              // Top-Heading
                              Align(
                                  alignment: Alignment.center,
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
                                                          Radius.circular(10))),
                                              child: Text(
                                                "Albert Flores",
                                                style: TextStyle(
                                                    fontFamily: 'Merriweather',
                                                    fontSize: 24),
                                              )),

                                          // information
                                          Row(
                                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              // Information 1
                                              Container(
                                                margin: EdgeInsets.all(10),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    // contact-number
                                                    Container(
                                                      child: Row(
                                                        children: [
                                                          Icon(
                                                            Icons.phone,
                                                            size: 22,
                                                          ),
                                                          Text("  "),
                                                          Text(
                                                            "(201) - 55 - 44",
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Merriweather',
                                                              fontSize: 16,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),

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
                                                            "bill.sanders@example.com",
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Merriweather',
                                                              fontSize: 16,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),

                                                    // Git account
                                                    Container(
                                                      child: Row(
                                                        children: [
                                                          Icon(
                                                            Icons.person,
                                                            size: 22,
                                                          ),
                                                          Text("  "),
                                                          Text(
                                                            "brownbear646",
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

                                              // Blank Line
                                              Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    60, 5, 10, 0),
                                                height: 80,
                                                width: 1,
                                                color: Colors.black,
                                              ),

                                              // Information 2
                                              Container(
                                                // margin: EdgeInsets.all(2),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      child: Row(
                                                        children: [
                                                          Icon(
                                                            Icons.send,
                                                            size: 22,
                                                          ),
                                                          Text("  "),
                                                          Text(
                                                            "redkoala509",
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
                                      child: Icon(Icons.account_circle_outlined,
                                          size: 120, color: Color(0xff7A370B)),
                                    ),
                                  ],
                                ),
                              ),

                              // Parsed-Information-Display Section
                              Container(
                                width: 900,
                                height: 700,
                                margin: EdgeInsets.only(top: 30),
                                color: Color(0xffE8E8E8),
                                child: Column(
                                  children: [
                                    getParsedInformationContainer("Skills"),

                                    getParsedInformationContainer(
                                        "Organizations"),

                                    getParsedInformationContainer("Languages"),

                                    getParsedInformationContainer("Countries"),

                                    getParsedInformationContainer(
                                        "Publications"),

                                    getParsedInformationContainer("Links"),

                                    Container(
                                      height: 100,
                                    ),

                                    // Export CVs
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: Color(0xff4D6658),
                                          onPrimary: Colors.white,
                                          textStyle: TextStyle(fontSize: 16),
                                          minimumSize: Size(291, 45),
                                          elevation: 10,
                                        ),
                                        onPressed: () {},
                                        child: Text(
                                          "Export CV",
                                          style: TextStyle(
                                              fontFamily: 'Eczar',
                                              fontSize: 15),
                                        ))
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),

                        // Resumes-List
                        Expanded(
                          child: Container(
                            color: Color(0xffFbFdF7),
                            height: 1010,
                            width: 590,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Resume-List Header
                                Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xffFbFdF7),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey,
                                        offset: Offset(0.0, 1.0), // (x, y)
                                        blurRadius: 6.0,
                                      )
                                    ],
                                  ),
                                  height: 85,
                                  width: 600,
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

                                              Icon(
                                                Icons.search_outlined,
                                                size: 20,
                                                color: Color(0xff864921),
                                              )
                                            ]))),

                                // Resumes-List-Containing-Container
                                Container(
                                    padding: EdgeInsets.all(16),
                                    height: 750,
                                    width: 600,
                                    // color: Colors.blue,
                                    child: SingleChildScrollView(
                                      child: Wrap(
                                        direction: Axis.horizontal,
                                        children: List.generate(items.length,
                                            (index) {
                                          return buildCard(items[index]);
                                        }),
                                      ),
                                    )),

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
                                          onPressed: () {},
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
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            primary: Color(0xff4D6658),
                                            onPrimary: Colors.white,
                                            textStyle: TextStyle(fontSize: 15),
                                            minimumSize: Size(164, 45),
                                            elevation: 10,
                                          ),
                                          onPressed: () {},
                                          child: Text(
                                            "Add Resumes (CVs)",
                                            style: TextStyle(
                                                fontFamily: 'Eczar',
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          )),
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
                }
                else {
                  newAnimation = true;
                }

                if (newAnimation) {
                  heightValues[currentIndex] = expandedHeight;
                  visiblitiyValues[currentIndex] = true;
                  angleValues[currentIndex] = 0;
                }
                else {
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

  Widget buildExpandedContainer(List<String> currentList, String name) =>
      Container(
        padding: EdgeInsets.fromLTRB(33, 15, 120, 10),
        height: 100,
        width: 800,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(currentList.length, (index) {
            String result =
                ((index + 1).toString() + '. ' + currentList[index]);

            return Text(
              result,
              style: TextStyle(fontFamily: 'Merriweather', fontSize: 16),
            );
          }),
        ),
      );

  List<String> getCurrentList(String name) {
    switch (name) {
      case 'Skills':
        return SkillsItems;
      case 'Organizations':
        return OrganizationsItems;
      case 'Languages':
        return LanguagesItems;
      case 'Countries':
        return CountriesItems;
      case 'Publications':
        return PublicationsItems;
      case 'Links':
        return LinksItems;
      default:
        return SkillsItems;
    }
  }

  Widget getParsedInformationContainer(String name) => AnimatedContainer(
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
      case 'Publications':
        return 4;
      case 'Links':
        return 5;
      default:
        return 0;
    }
  }
}
