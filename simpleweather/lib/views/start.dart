import 'package:flutter/material.dart';
import 'package:location/location.dart';

class StartView extends StatelessWidget {
  const StartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: const Text('Start Views'),
    ));
  }
}
