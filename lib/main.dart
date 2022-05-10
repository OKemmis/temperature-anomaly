import 'dart:async';
import 'package:flutter/material.dart';
import 'globals.dart' as globals;

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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          body: Center(
            child: Text(
              globals.years[yearCounter++].toString(),
            ),
          ),
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
        // Change colour here
        final tempAnomaly = globals.temperatureAnomaly[yearCounter];
        if (tempAnomaly == 0.0) {
          red = 0;
          blue = 0;
        } else if (tempAnomaly < 0.0) {
          red = 0;
          blue = 255 - (tempAnomaly * 150.0).toInt().abs();
          print(blue);
        } else {
          red = 255 - (tempAnomaly * 150.0).toInt();
          blue = 0;
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }
}
