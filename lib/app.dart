import 'package:flutter/material.dart';

import 'metronome/metronome.dart';

class MetroApp extends MaterialApp {
  MetroApp({Key key})
      : super(
            theme: ThemeData(
              primaryColor: Color(0xffB74D4D),
              accentColor: Color(0xffB74D4D),
              canvasColor: Color(0xffEDEE61),
            ),
            home: const MetroPage(),
            debugShowCheckedModeBanner: false);
}
