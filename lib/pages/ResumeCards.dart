import 'dart:convert';

import 'package:cv_parser/scripts/local_storage.dart';

class ResumeCards {
  final String name;
  String email = "";
  bool parsed = false;

  List<dynamic> jsonList = [];

  ResumeCards({
    required this.name,
    required this.parsed
  }) {
    if (this.name != "blank" && parsed == true) {
      jsonList = jsonDecode(load(name)) as List;
      parsingData();
    }
  }

  List<String> skillItems = [];
  List<String> organizationItems = [];
  List<String> languagesItems = [];
  List<String> countriesItems = [];
  List<String> publicationsItems = [];
  List<String> linksItems = [];
  List<String> norpItems = [];
  List<String> gpeItems = [];
  List<String> degreeItems = [];

  void parsingData() {
    for(int i = 0; i < jsonList.length; i++) {
      switch (jsonList[i]["label"]) {
        case "CsSkill":
          skillItems.add(jsonList[i]["match"]);
          break;
        case "GPE":
          gpeItems.add(jsonList[i]["match"]);
          break;
        case "Degree":
          degreeItems.add(jsonList[i]["match"]);
          break;
        case "NORP":
          norpItems.add(jsonList[i]["match"]);
          break;
        case "ORG":
          organizationItems.add(jsonList[i]["match"]);
          break;
        case "LANGUAGE":
          languagesItems.add(jsonList[i]["match"]);
          break;
        case "Links":
          linksItems.add(jsonList[i]["match"]);
          break;
        case "emails":
          email = "";
          email = jsonList[i]["match"];
          break;
      }
    }
  }
}
