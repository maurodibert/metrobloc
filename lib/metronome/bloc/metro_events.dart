import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

abstract class MetroEvent extends Equatable {
  const MetroEvent();

  @override
  List<Object> get props => [];
}

class MetroInitialized extends MetroEvent {
  final int speed;
  final int count;
  MetroInitialized({@required this.speed, @required this.count});

  @override
  String toString() => "Metro runned at: $speed";
}

class MetroStopped extends MetroEvent {
  @override
  String toString() => "Metro stopped";
}

class MetroTicked extends MetroEvent {
  final int count;
  MetroTicked({@required this.count});

  @override
  String toString() => "Metro ticked";
}
