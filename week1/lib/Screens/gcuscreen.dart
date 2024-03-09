import 'package:flutter/material.dart';

class gcuscreen extends StatelessWidget {
  const gcuscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("GCU")),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: const EdgeInsets.all(4),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "gcuImage.jpg",
                ),
                fit: BoxFit.fill)),
        child: Center(
            child: Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Color.fromARGB(167, 33, 149, 243)),
                child: const Text(
                  "Welcome to GCU",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ))),
      ),
    );
  }
}
