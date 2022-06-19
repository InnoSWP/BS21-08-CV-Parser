import 'dart:convert';

import 'package:cv_parser/scripts/local_storage.dart';

class ResumeCards {
  final String name;
  String email = "";

  List<dynamic> jsonList = [];

  ResumeCards({
    required this.name,
  }) {
    if (this.name != "blank") {
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

  void parsingData() {
    jsonList.forEach((element) {
      switch (element["label"]) {
        case "CsSkill":
          skillItems.add(element["match"]);
          break;
        case "ORG":
          organizationItems.add(element["match"]);
          break;
        case "LANGUAGE":
          languagesItems.add(element["match"]);
          break;
        case "Links":
          linksItems.add(element["match"]);
          break;
        case "emails":
          email = element["match"];
          break;
      }
    });

    // print(organizationItems);
  }
}
