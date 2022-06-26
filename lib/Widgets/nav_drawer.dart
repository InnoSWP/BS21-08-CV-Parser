import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cv_parser/pages/AboutScreen.dart';
import 'package:cv_parser/pages/ContactScreen.dart';
import 'package:cv_parser/pages/ParsedInformationScreen.dart';
import 'package:cv_parser/pages/HomeScreen.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = const EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Color(0xff864921),
        child: ListView(
          children: <Widget>[
            const SizedBox(
              height: 48,
            ),
            buildMenuItem(
                text: "Home",
                icon: Icons.home,
                onCliked: () => selectItem(context, 0)),
            const SizedBox(height: 16),
            buildMenuItem(
                text: "About",
                icon: Icons.info,
                onCliked: () => selectItem(context, 1)),
            const SizedBox(height: 16),
            buildMenuItem(
                text: "Contact",
                icon: Icons.phone,
                onCliked: () => selectItem(context, 2))
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onCliked,
  }) {
    final color = Colors.white;
    return ListTile(
      leading: Icon(
        icon,
        color: color,
        size: 40,
      ),
      title: Text(
        text,
        style:
            TextStyle(color: color, fontSize: 24, fontFamily: "Merriweather"),
      ),
      onTap: onCliked,
    );
  }

  void selectItem(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => HomeScreen()));
        break;
      case 1:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => AboutScreen()));
        break;
      case 2:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => ContactScreen()));
        break;
    }
  }
}
