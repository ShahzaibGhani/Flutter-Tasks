// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:week5/common/bottomnavbar.dart';
import 'package:week5/common/menudrawer.dart';

class GcuScreen extends StatelessWidget {
  const GcuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("GCU APP")),
        backgroundColor: Colors.blue,
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
