import 'package:cv_parser/pages/AboutScreen.dart';
import 'package:cv_parser/pages/ContactScreen.dart';
import 'package:cv_parser/pages/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // NavBar

      body: Container(
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
                                  // basic-information
                                  Container(
                                    padding: EdgeInsets.fromLTRB(21, 8, 22, 21),
                                    width: 621,
                                    height: 169,
                                    decoration: BoxDecoration(
                                        color: Color(0xffF2EEE1),
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                    child: Column(
                                      children: [


                                        // Name of Person
                                        Container(
                                            padding: EdgeInsets.fromLTRB(12, 7, 84, 8),
                                            width: 575,
                                            height: 43,
                                            decoration: BoxDecoration(
                                                color: Color(0xffFBFDF7),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10))),
                                            child: Text(
                                              "Albert Flores",
                                              style: TextStyle(
                                                  fontFamily: 'Merriweather',
                                                  fontSize: 24),
                                            )),

                                        // information
                                        Row(
                                          children: [

                                            // Information 1
                                            Container(
                                              // margin: const EdgeInsets.only(top: 10),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children:[
                                                  // contact-number
                                                  Container(
                                                    child: Row(
                                                      children: [
                                                        Icon(Icons.phone, size: 22,),
                                                        Text("  "),
                                                        Text("(201) - 55 - 44", style: TextStyle(
                                                          fontFamily: 'Merriweather',
                                                          fontSize: 16,
                                                        ),)
                                                      ],
                                                    ),
                                                  ),


                                                  // Email-ID
                                                  Container(
                                                    child: Row(
                                                      children: [
                                                        Icon(Icons.alternate_email, size: 22,),
                                                        Text("  "),
                                                        Text("bill.sanders@example.com", style: TextStyle(
                                                          fontFamily: 'Merriweather',
                                                          fontSize: 16,
                                                        ),)
                                                      ],
                                                    ),
                                                  ),

                                                  // Git account
                                                  Container(
                                                    child: Row(
                                                      children: [
                                                        Icon(Icons.person, size: 22,),
                                                        Text("  "),
                                                        Text("brownbear646", style: TextStyle(
                                                          fontFamily: 'Merriweather',
                                                          fontSize: 16,
                                                        ),)
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),


                                            // Blank Line
                                            Container(

                                            ),


                                            // Information 2
                                            Container(

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
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(7.0))),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 900,
                    height: 350,
                    color: Colors.black,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(65.0, 0.0, 25.0, 10.0),
                      child: Column(

                        children: [
                          Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Container(
                              width: 900,
                              height: 60,
                              color: Colors.white,
                              child: const Text(
                                "Skills",
                                style: TextStyle(
                                  fontSize: 36,
                                  color: Color(0xff864921),
                                  fontFamily: 'Eczar',
                                  fontWeight: FontWeight.w400,
                                ),
                            ),
                          ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Container(
                              width: 900,
                              height: 60,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
