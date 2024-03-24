// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:week2/common/bottomnavbar.dart';
import 'package:week2/common/menudrawer.dart';

class GcuScreen extends StatelessWidget {
  const GcuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("GCU APP")),
        backgroundColor: const Color.fromARGB(183, 4, 103, 218),
      ),
      drawer: MenuDrawer(),
      bottomNavigationBar: BottomNavbar(),
      body: Container(
        padding: const EdgeInsets.all(4),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "gcuImage.jpg",
                ),
                fit: BoxFit.fill)),
      ),
    );
  }
}
