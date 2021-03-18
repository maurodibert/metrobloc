import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_metronome/app.dart';
import 'package:flutter_metronome/bloc_observer.dart';

void main() async {
  Bloc.observer = MetroObserver();
  runApp(MetroApp());
}
