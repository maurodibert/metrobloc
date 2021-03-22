import 'package:flutter_metronome/metronome/metronome.dart';

class Ticker {
  Stream<MetroTicked> tick(int newSpeed) {
    return Stream.periodic(
        Duration(milliseconds: (60 / newSpeed * 1000).floor()), (count) => MetroTicked(count: count));
  }
}
