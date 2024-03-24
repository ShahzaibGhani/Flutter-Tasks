import 'package:flutter/material.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  String message = "";
  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();
  late int counter;

  @override
  void initState() {
    counter = 0;
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(183, 4, 103, 218),
      appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Center(
            child: Text("About Us"),
          )),
      body: Column(children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 50, left: 50, right: 50, bottom: 10),
            child: TextField(
              style: const TextStyle(fontSize: 18),
              controller: name,
              decoration: const InputDecoration(
                hintText: "Enter Your Name: ",
              ),
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 50, right: 50, top: 10, bottom: 50),
            child: TextField(
              style: const TextStyle(fontSize: 18),
              controller: age,
              decoration: const InputDecoration(
                hintText: "Enter Your Age: ",
              ),
            ),
          ),
        ),
        Center(
          child: ElevatedButton(
            onPressed: onButtonPress,
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.black,
                textStyle: const TextStyle(fontSize: 20),
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            child: const Text("Click Here"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(40.0),
          child: Text(
            message,
            style: const TextStyle(fontSize: 20),
          ),
        )
      ]),
    );
  }

  void onButtonPress() {
    setState(() {
      counter = counter + 1;
      message = "Welcome ${name.text}\nAge : ${age.text}\nYou Click : $counter Time(s)";
    });
  }
}
