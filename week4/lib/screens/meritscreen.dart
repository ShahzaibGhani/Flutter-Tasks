import 'package:flutter/material.dart';
import 'package:week4/common/bottomnavbar.dart';
import 'package:week4/common/menudrawer.dart';

class MeritScreen extends StatefulWidget {
  const MeritScreen({super.key});

  @override
  State<MeritScreen> createState() => _MeritScreenState();
}

class _MeritScreenState extends State<MeritScreen> {
  bool isMDCAT = true;
  bool isECAT = false;
  TextEditingController interMarks = TextEditingController();
  TextEditingController entryTestMarks = TextEditingController();
  String calculateMerit = "";
  String hintMessage = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (isMDCAT) {
      hintMessage = "Enter the Marks of MDCAT";
    } else {
      hintMessage = "Enter the Marks of ECAT";
    }

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
        body: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ToggleButtons(
                  isSelected: [isMDCAT, isECAT],
                  onPressed: (index) {
                    switch (index) {
                      case 0:
                        isMDCAT = true;
                        isECAT = false;
                        break;
                      case 1:
                        isMDCAT = false;
                        isECAT = true;
                        break;
                      default:
                    }
                    setState(() {
                      interMarks.text = "";
                      entryTestMarks.text = "";
                      calculateMerit = "";
                    });
                  },
                  fillColor: Colors.blue,
                  selectedColor: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                  borderWidth: 1,
                  constraints: const BoxConstraints.expand(width: 120, height: 50),
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        "MDCAT",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        "ECAT",
                        style: TextStyle(fontSize: 16),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40, left: 40, right: 40, bottom: 10),
              child: TextField(style: const TextStyle(fontSize: 18), 
                decoration:
                    const InputDecoration(hintText: "Enter the Marks of Intermediate"),
                keyboardType: TextInputType.number,
                controller: interMarks,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 40, right: 40, bottom: 50),
              child: TextField( style: const TextStyle(fontSize: 18),
                decoration: InputDecoration(hintText: hintMessage),
                keyboardType: TextInputType.number,
                controller: entryTestMarks,
              ),
            ),
            ElevatedButton(
            onPressed: onButtonPress,
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.black,
                textStyle: const TextStyle(fontSize: 20),
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            child: const Text("Calculate Merit"),
          ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Text(calculateMerit ,style: const TextStyle(fontSize: 25),),
            )
          ],
        ) // Set your desired background color here
        );
  }

  void onButtonPress() {
    double merit = 0;
    if (isMDCAT) {
      double intermarks = double.tryParse(interMarks.text) ?? 0;
      double entrytestMarks = double.tryParse(entryTestMarks.text) ?? 0;
      merit =
          (((intermarks / 1100) * 0.5) + ((entrytestMarks / 200) * 0.5)) * 100;
    } else {
      double intermarks = double.tryParse(interMarks.text) ?? 0;
      double entrytestMarks = double.tryParse(entryTestMarks.text) ?? 0;
      merit =
          (((intermarks / 1100) * 0.7) + ((entrytestMarks / 400) * 0.3)) * 100;
    }
    setState(() {
      calculateMerit = "Merit Score: ${merit.toStringAsFixed(3)}";
    });
  }
}
