import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:temperature_anomaly/loop_page.dart';

void main() {
  runApp(
    const MaterialApp(
      home: InfoPage(),
    ),
  );
}

class InfoPage extends StatefulWidget {
  const InfoPage({Key? key}) : super(key: key);

  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.red, Colors.blue])),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                // Heading text
                Text(
                  "Info",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                    textStyle:
                        const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),

                // Sized box for spacing
                const SizedBox(
                  height: 50,
                ),

                // TEXT

                // Subheading text
                Text(
                  "Source:",
                  style: GoogleFonts.lato(
                    textStyle:
                        const TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  textAlign: TextAlign.center,
                ),

                // Source text
                Text(
                  "Data sourced from NOAA (National Centers for Environmental Information)",
                  style: GoogleFonts.lato(
                    textStyle:
                        const TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  textAlign: TextAlign.center,
                ),

                // Link text
                Text(
                  "Available here: https://www.ncdc.noaa.gov/cag/global/time-series",
                  style: GoogleFonts.lato(
                    textStyle:
                        const TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  textAlign: TextAlign.center,
                ),

                // Details text
                Text(
                  "\nTemperature anomaly for years: 1880-2021, compared to a 1901-2000 base period\nColour temperature (blue-red) corresponds to anomaly\n\n \u00A9 Otto Kemmis 2022",
                  style: GoogleFonts.lato(
                    textStyle:
                        const TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  textAlign: TextAlign.center,
                ),

                // Sized box for spacing
                const SizedBox(
                  height: 50,
                ),

                // Back button
                FloatingActionButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  backgroundColor: Colors.white,
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.black,
                  ),
                ),
              ])),
        ),
      ),
    );
  }
}
