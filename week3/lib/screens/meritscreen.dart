import 'package:flutter/material.dart';
import 'package:week3/common/bottomnavbar.dart';
import 'package:week3/common/menudrawer.dart';

class MeritScreen extends StatelessWidget {
  const MeritScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          "Merit Calculator",
          style: TextStyle(fontSize: 22),
        )),
        backgroundColor: const Color.fromARGB(183, 4, 103, 218),
      ),
      drawer: const MenuDrawer(),
      bottomNavigationBar: const BottomNavbar(),
      body: const Scaffold(
        backgroundColor: Color.fromARGB(
            255, 255, 255, 255), // Set your desired background color here
        body: Center(
          child: Text(
            "Merit Screen",
            style: TextStyle(fontSize: 24),
          ),
        ),
      ), // Set your desired background color here
    );
  }
}
