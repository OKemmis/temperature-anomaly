import 'dart:async';
import 'package:flutter/material.dart';
import 'globals.dart' as globals;
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    const MaterialApp(
      home: LoopPage(),
    ),
  );
}

class LoopPage extends StatefulWidget {
  const LoopPage({Key? key}) : super(key: key);

  _LoopPageState createState() => _LoopPageState();
}

class _LoopPageState extends State<LoopPage> {
  int alpha = 0;
  int red = 0;
  int green = 0;
  int blue = 0;
  int yearCounter = 0;
  num tempAnomaly = globals.temperatureAnomaly[0];

  @override
  Widget build(BuildContext context) {
    var year = globals.years[yearCounter].toString();
    return MaterialApp(
        home: Scaffold(
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Year text
              Text(
                year,
                style: GoogleFonts.lato(
                  textStyle: const TextStyle(color: Colors.white, fontSize: 50),
                ),
              ),

              // Temperature anomaly text
              Text(
                tempAnomaly.toString(),
                style: GoogleFonts.lato(
                  textStyle: const TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),

              // Sized Box for spacing
              const SizedBox(
                height: 50,
              ),

              // Floating action button to pause execution
              FloatingActionButton(
                onPressed: () {
                  if (timer.isActive) {
                    dispose();
                  } else {
                    createTimer();
                  }
                },
                child: const Icon(
                  Icons.stop,
                  color: Colors.black,
                ),
                backgroundColor: Colors.white,
              ),
            ],
          )),
        ),
        theme: ThemeData(
          canvasColor: Color.fromARGB(alpha, red, green, blue),
        ));
  }

  late Timer timer;

  @override
  void initState() {
    super.initState();
    createTimer();
  }

  // Create a new periodic timer
  void createTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        yearCounter++;
        tempAnomaly = globals.temperatureAnomaly[yearCounter];
        setColours();
      });
    });
  }

  // Helper function to set colour values for background
  void setColours() {
    alpha = 100;
    red = (0xff * 1 - ((tempAnomaly + 0.63) / 1.89)).toInt();
    green = 0;
    blue = (0xff * tempAnomaly + 0.63) ~/ 1.89;
  }

  @override
  void dispose() {
    timer.cancel();
  }
}
