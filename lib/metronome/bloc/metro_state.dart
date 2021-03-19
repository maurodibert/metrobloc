import 'package:equatable/equatable.dart';

abstract class MetroState extends Equatable {
  final int count;
  MetroState(this.count);

  @override
  List<Object> get props => [count];
}

class MetroOn extends MetroState {
  final int count;

  MetroOn(this.count) : super(count);

  @override
  String toString() => "Ticking $count";
}

class MetroOff extends MetroState {
  MetroOff() : super(0);

  @override
  String toString() => "Metro OFF";
}
