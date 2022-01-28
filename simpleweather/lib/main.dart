import 'package:flutter/material.dart';
import 'route/route.dart' as route;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Simple Weather',
        theme: ThemeData(),
        themeMode: ThemeMode.dark,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: route.controller,
        initialRoute: route.startPage);
  }
}
