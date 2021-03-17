import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

abstract class MetroEvent extends Equatable {
  const MetroEvent();

  @override
  List<Object> get props => [];
}

class MetroRunned extends MetroEvent {
  final int speed;
  MetroRunned({@required this.speed});

  @override
  String toString() => "Metro runned at: $speed";
}

class MetroStopped extends MetroEvent {
  @override
  String toString() => "Metro stopped";
}

class MetroTicked extends MetroEvent {
  @override
  String toString() => "Metro ticked";
}
