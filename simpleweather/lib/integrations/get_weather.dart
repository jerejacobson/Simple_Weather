import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:simpleweather/integrations/get_location.dart';
import 'package:weather/weather.dart';
import 'package:intl/intl.dart';

// Class that has functions and widgets for building the weather App

class GetWeather extends StatelessWidget {
  const GetWeather({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getWeather5Day(),
      //initialData: InitialData,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        final weatherData = snapshot.data;
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const Center(child: CircularProgressIndicator());
          default:
            if (snapshot.hasError) {
              return const Center(child: Text('Error Fetching Data!'));
            } else {
              return buildLocationInfo(weatherData);
            }
        }
      },
    );
  }

  Widget buildLocationInfo(List<Weather> weatherData) => Center(
        child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    weatherData[0].areaName!,
                    style: GoogleFonts.oxygen(
                        fontWeight: FontWeight.bold,
                        fontSize: 48,
                        color: Colors.black),
                  ),
                  Center(
                    child: Lottie.asset(parseImageinfo(weatherData[0])),
                  ),
                  Text(
                    weatherData[0].weatherDescription!,
                    style: GoogleFonts.oxygen(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    "Temperature:  " +
                        weatherData[0]
                            .temperature!
                            .fahrenheit!
                            .toStringAsFixed(1) +
                        "°",
                    style: GoogleFonts.oxygen(
                        fontWeight: FontWeight.bold,
                        fontSize: 36,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildWeatherCard(weatherData[8]),
                      buildWeatherCard(weatherData[16]),
                      buildWeatherCard(weatherData[24]),
                    ],
                  ),
                ])),
      );

//Get Single Day Weather from OpenWeather api

  Future<Weather> getWeather() async {
    var locat = const MyLocation();
    var locc = await locat.getLoc();
    double? latitude = locc.latitude;
    double? longitude = locc.longitude;

    String key = '4046aaab50f9ff975f624b5fa11903ba';
    WeatherFactory wf = WeatherFactory(key);
    Weather w = await wf.currentWeatherByLocation(latitude!, longitude!);
    return w;
  }

//Get 5 Day Weather from OpenWeather api for my 3 day forecast cards

  Future<List<Weather>> getWeather5Day() async {
    var locat = const MyLocation();
    var locc = await locat.getLoc();
    double? latitude = locc.latitude;
    double? longitude = locc.longitude;

    String key = '4046aaab50f9ff975f624b5fa11903ba';
    WeatherFactory wf = WeatherFactory(key);
    List<Weather> w = await wf.fiveDayForecastByLocation(latitude!, longitude!);
    return w;
  }

// Function to return the correct image asset for the weather conditions

  String parseImageinfo(Weather weatherData) {
    DateTime weatherTime = weatherData.date!;
    String folderVariable = "day";
    if (weatherTime.hour > 18 || weatherTime.hour < 7) {
      folderVariable = "night";
    }

    int weatherID = weatherData.weatherConditionCode!;

    if (weatherID <= 299) {
      return 'assets/WeatherLottieFiles/' + folderVariable + '/200.json';
    }
    if (weatherID <= 400) {
      return 'assets/WeatherLottieFiles/' + folderVariable + '/300.json';
    }
    if (weatherID <= 699) {
      return 'assets/WeatherLottieFiles/' + folderVariable + '/600.json';
    }
    if (weatherID <= 799) {
      return 'assets/WeatherLottieFiles/' + folderVariable + '/700.json';
    }
    if (weatherID == 800) {
      return 'assets/WeatherLottieFiles/' + folderVariable + '/800.json';
    }
    return 'assets/WeatherLottieFiles/' + folderVariable + '/801.json';
  }
}

// 3 Day Weather Card Widget

Widget buildWeatherCard(Weather weatherData) {
  return Card(
      child: Padding(
          padding: const EdgeInsets.all(10),
          child: SizedBox(
            width: 75,
            height: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  DateFormat(DateFormat.ABBR_WEEKDAY).format(weatherData.date!),
                  textAlign: TextAlign.center,
                  style: GoogleFonts.oxygen(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black),
                ),
                Text(
                  weatherData.temperature!.fahrenheit!.toStringAsFixed(1) + "°",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.oxygen(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.black),
                ),
                Text(
                  weatherData.weatherDescription!,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.oxygen(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black),
                ),
              ],
            ),
          )));
}
