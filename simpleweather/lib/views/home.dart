import 'package:flutter/material.dart';
import 'package:simpleweather/integrations/get_weather.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Material(
      child: GetWeather(),
      color: Color(0xFFF5F5F5),
    );
  }
}
