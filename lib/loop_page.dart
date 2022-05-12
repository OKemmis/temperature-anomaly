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
              Align(
                alignment: Alignment.topLeft,
                child:
                    // Back button test
                    FloatingActionButton(
                  backgroundColor: Colors.black.withOpacity(0),
                  highlightElevation: 0,
                  focusElevation: 0,
                  hoverElevation: 0,
                  elevation: 0,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.arrow_back_ios_new_sharp),
                ),
              ),

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

              // Sized Box for spacing
              const SizedBox(
                height: 50,
              ),

              // Progress indicator
              SizedBox(
                child: LinearProgressIndicator(
                  value: (yearCounter / 141).toDouble(),
                  backgroundColor: Colors.white,
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.black),
                  semanticsLabel: "Linear progress indicator",
                ),
                width: MediaQuery.of(context).size.width * 0.8,
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
      if (yearCounter == 141) {
        print(globals.years.length);
        timer.cancel();
        Navigator.pop(context);
      }
      setState(() {
        print(yearCounter);
        yearCounter++;
        tempAnomaly = globals.temperatureAnomaly[yearCounter];
        setColours();
      });
    });
  }

  // Helper function to set colour values for background
  void setColours() {
    if (tempAnomaly == 0.0) {
      alpha = 100;
      red = 0;
      green = 0;
      blue = 0;
    } else if (tempAnomaly < 0.0) {
      alpha = 100;
      red = 0;
      green = 0;
      blue = 255 - (tempAnomaly * 150.0).toInt().abs();
    } else {
      alpha = 100;
      red = 255 - (tempAnomaly * 150.0).toInt();
      green = 0;
      blue = 0;
    }
  }

  @override
  void dispose() {
    timer.cancel();
  }
}
