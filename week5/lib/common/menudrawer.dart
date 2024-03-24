import 'package:flutter/material.dart';
import 'package:week5/screens/aboutusscreen.dart';
import 'package:week5/screens/gcuscreen.dart';
import 'package:week5/screens/meritscreen.dart';
import 'package:week5/screens/weatherscreen.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      child: ListView(
        children: buildMenuItems(context),
      ),
    );
  }

  List<Widget> buildMenuItems(BuildContext context) {
    List<Widget> menuItems = [];
    menuItems.add(const SizedBox(
      height: 65,
      child: DrawerHeader(
          child: Text(
        "Menu",
        style: TextStyle(fontSize: 25, color: Color.fromARGB(183, 4, 103, 218)),
      )),
    ));

    final Set<String> menuTitles = {
      "Home",
      "Merit Calculator",
      "Weather",
      "About"
    };
    menuTitles.forEach((element) {
      menuItems.add(ListTile(
        title: Text(element, style: const TextStyle(fontSize: 18)),
        onTap: () {
          Widget screen = Container();
          switch (element) {
            case "Home":
              screen = GcuScreen();
              break;
            case "Merit Calculator":
              screen = MeritScreen();
              break;
            case "About":
              screen = AboutUsScreen();
            case "Weather":
              screen = WeatherScreen();
            default:
          }
          Navigator.of(context).pop();
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => screen));
        },
      ));
    });
    return menuItems;
  }
}
