import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './app/app.dart';

void main() async {
  runApp(App());

  //

  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );

//
}
