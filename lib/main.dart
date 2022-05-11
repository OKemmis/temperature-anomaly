import 'dart:async';
import 'package:flutter/material.dart';
import 'globals.dart' as globals;
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    const MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int red = 0;
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
              Text(
                year,
                style: GoogleFonts.lato(
                  textStyle: const TextStyle(color: Colors.white, fontSize: 50),
                ),
              ),
              Text(
                tempAnomaly.toString(),
                style: GoogleFonts.lato(
                  textStyle: const TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ],
          )),
        ),
        theme: ThemeData(
          canvasColor: Color.fromARGB(150, red, 10, blue),
        ));
  }

  Timer? timer;

  @override
  void initState() {
    super.initState();

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
    if (tempAnomaly == 0.0) {
      red = 0;
      blue = 0;
    } else if (tempAnomaly < 0.0) {
      red = 0;
      blue = 255 - (tempAnomaly * 150.0).toInt().abs();
    } else {
      red = 255 - (tempAnomaly * 150.0).toInt();
      blue = 0;
    }
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }
}
