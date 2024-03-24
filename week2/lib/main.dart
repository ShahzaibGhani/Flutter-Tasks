import 'package:flutter/material.dart';
import 'package:week2/screens/gcuscreen.dart';
import 'package:week2/screens/meritscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => GcuScreen(),
        "/merit": (context) => MeritScreen()
      },
    );
  }
}
