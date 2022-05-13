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
  num tempAnomaly = globals.new_data[0];
  bool positiveTempAnomaly = false;
  Color? color = Colors.blue;

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
                  timer.cancel();
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
                value: (yearCounter / 143).toDouble(),
                backgroundColor: Colors.white,
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.black),
                semanticsLabel: "Linear progress indicator",
              ),
              width: MediaQuery.of(context).size.width * 0.8,
            ),
          ],
        )),
      ),

      // Set the background colour here
      theme: ThemeData(
        canvasColor: color,
      ),
    );
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
        //print(globals.years.length);
        dispose();
        Navigator.pop(context);
      } else {
        setState(() {
          print(yearCounter);
          yearCounter++;
          tempAnomaly = globals.new_data[yearCounter];
          setColours();
        });
      }
    });
  }

  // Helper function to set colour values for background
  void setColours() {
    var colourValue;

    Map<int, Color> coloursRed = {
      0: Colors.red.shade50,
      1: Colors.red.shade100,
      2: Colors.red.shade200,
      3: Colors.red.shade300,
      4: Colors.red.shade400,
      5: Colors.red.shade500,
      6: Colors.red.shade600,
      7: Colors.red.shade700,
      8: Colors.red.shade800,
      9: Colors.red.shade900,
      10: Colors.red.shade900,
    };

    Map<int, Color> coloursBlue = {
      0: Colors.blue.shade50,
      1: Colors.blue.shade100,
      2: Colors.blue.shade200,
      3: Colors.blue.shade300,
      4: Colors.blue.shade400,
      5: Colors.blue.shade500,
      6: Colors.blue.shade600,
      7: Colors.blue.shade700,
      8: Colors.blue.shade800,
      9: Colors.blue.shade900,
      10: Colors.blue.shade900
    };

    if (tempAnomaly > 0) {
      colourValue = (tempAnomaly ~/ (0.99 / 10.0)).round() + 1;
      color = coloursRed[colourValue];
    } else {
      colourValue = (tempAnomaly ~/ (-0.46 / 10.0)).round() + 1;
      color = coloursBlue[colourValue];
    }
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }
}
