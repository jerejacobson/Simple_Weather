import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:weather/weather.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: const Text('Home Views'),
    ));
  }
}
