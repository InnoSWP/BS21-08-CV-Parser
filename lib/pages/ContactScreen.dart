import 'package:cv_parser/pages/HomeScreen.dart';
import 'package:cv_parser/pages/ParsedInformationScreen.dart';
import 'package:cv_parser/pages/AboutScreen.dart';
import 'package:cv_parser/pages/ContactScreen.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class ContactScreen extends StatefulWidget {
  static PageRouteBuilder getRoute() {
    return PageRouteBuilder(pageBuilder: (_, __, ___) {
      return ContactScreen();
    });
  }

  const ContactScreen({Key? key}) : super(key: key);

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
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
                      "Contact",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontFamily: 'Eczar',
                          fontWeight: FontWeight.w700),
                      textAlign: TextAlign.center,
                    ),
                    const Text(
                      "Home / Contact ",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontFamily: 'Eczar'),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              // Middle Container old
              Container(
                height: 600,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 832,
                        width: 867,
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 30.0),
                            const Text(
                              "Get In Touch",
                              style: TextStyle(
                                fontSize: 36,
                                color: Color(0xff864921),
                                fontFamily: 'Eczar',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const Text(
                              "We are help for you! How can we help you?",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color(0xff864921),
                                  fontFamily: 'Eczar'),
                            ),
                            SizedBox(height: 20.0),
                            Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 6.0),
                                child: Column(children: <Widget>[
                                  TextField(
                                    decoration: InputDecoration(
                                      filled: true,
                                      hintText: "Name",
                                      border: InputBorder.none,
                                    ),
                                  ),
                                  SizedBox(height: 8.0),
                                  TextField(
                                    decoration: InputDecoration(
                                      filled: true,
                                      hintText: "Email",
                                      border: InputBorder.none,
                                    ),
                                  ),
                                  SizedBox(height: 8.0),
                                  TextField(
                                    maxLines: 9,
                                    decoration: InputDecoration(
                                      filled: true,
                                      hintText: "Message",
                                      border: InputBorder.none,
                                    ),
                                  ),
                                  SizedBox(height: 16.0),
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Color(0xff4D6658),
                                        onPrimary: Colors.white,
                                        textStyle: TextStyle(fontSize: 16),
                                        minimumSize: Size(60, 40),
                                        elevation: 10,
                                      ),
                                      onPressed: () {},
                                      child: const Text(" Submit ",
                                          style: TextStyle(
                                              fontFamily: 'Eczar',
                                              fontWeight: FontWeight.w300)))
                                ]))
                          ],
                        ),
                      ),
                    )
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
}
