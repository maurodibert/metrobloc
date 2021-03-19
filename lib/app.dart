import 'package:flutter/material.dart';

import 'metronome/metronome.dart';

class MetroApp extends MaterialApp {
  MetroApp({Key key})
      : super(
            theme: ThemeData(
              primaryColor: Color(0xff01D2E4),
              brightness: Brightness.dark,
            ),
            home: const MetroPage());
}
