import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:temperature_anomaly/info_page.dart';
import 'package:temperature_anomaly/loop_page.dart';

void main() {
  runApp(
    const MaterialApp(
      home: MainPage(),
    ),
  );
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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
                  "Visualise mean temperature anomaly with colours!",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                    textStyle:
                        const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),

                // Sized box for spacing
                const SizedBox(
                  height: 10,
                ),

                // Info page button
                TextButton.icon(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const InfoPage()));
                    },
                    icon: const Icon(Icons.info, color: Colors.white),
                    label: const Text("More Info",
                        style: TextStyle(color: Colors.white))),

                // Sized box for spacing
                const SizedBox(
                  height: 30,
                ),

                // Instruction text
                Text(
                  "Press to start",
                  style: GoogleFonts.lato(
                    textStyle:
                        const TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),

                // Sized box for spacing
                const SizedBox(
                  height: 20,
                ),

                // Start button
                FloatingActionButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoopPage()));
                  },
                  backgroundColor: Colors.white,
                  child: const Icon(
                    Icons.play_arrow,
                    color: Colors.black,
                  ),
                ),
              ])),
        ),
      ),
    );
  }
}
