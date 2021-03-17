import 'package:equatable/equatable.dart';

abstract class MetroState extends Equatable {
  const MetroState();

  @override
  List<Object> get props => [];
}

class MetroOn extends MetroState {
  @override
  String toString() => "Metro ON";
}

class MetroTicking extends MetroState {
  @override
  String toString() => "Ticking . ";
}

class MetroOff extends MetroState {
  @override
  String toString() => "Metro OFF";
}
