import 'package:flutter/material.dart';
import 'package:simpleweather/views/home.dart';
import 'package:simpleweather/views/start.dart';

// Define Routes

// Route Names
const String startPage = 'start';
const String homePage = 'home';

// Controling the page flow with pre-setup routes
Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case startPage:
      return MaterialPageRoute(builder: (context) => const StartView());
    case homePage:
      return MaterialPageRoute(builder: (context) => const HomeView());
    default:
      throw ('This route name does not exit');
  }
}
