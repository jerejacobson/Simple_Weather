import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:simpleweather/views/home.dart';

class StartView extends StatelessWidget {
  const StartView({Key? key}) : super(key: key);

//A simple first start page for the weather application
//This example page uses a column and sized boxes to get a clean well spaced layout.
// Featured is a lottie file for animating an image. "wow so pretty"

  @override
  Widget build(BuildContext context) {
    return Material(
        color: const Color(0xFFF5F5F5),
        child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Lottie.asset(
                      'assets/WeatherLottieFiles/4800-weather-partly-cloudy.json'),
                ),
                Text(
                  "Simple",
                  style: GoogleFonts.oxygen(
                      fontWeight: FontWeight.bold,
                      fontSize: 48,
                      color: Colors.black),
                ),
                Text(
                  "Weather",
                  style: GoogleFonts.oxygen(
                      fontWeight: FontWeight.bold,
                      fontSize: 48,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 50,
                ),
                Text(
                  "A simple weather app to get you \n through the day, rain or shine.",
                  style: GoogleFonts.oxygen(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                    onPressed: () => {
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                            builder: (context) => const HomeView(),
                          ))
                        },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
                      child: Text(
                        "Get Started",
                        style: GoogleFonts.oxygen(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Colors.white),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        elevation: 20,
                        fixedSize: const Size(250, 75),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))))
              ],
            )));
  }
}
