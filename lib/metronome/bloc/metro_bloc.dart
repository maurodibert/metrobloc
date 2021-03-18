import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_metronome/metronome/metronome.dart';
import 'package:flutter_metronome/ticker.dart';

class MetroBloc extends Bloc<MetroEvent, MetroState> {
  static const int count = 0;

  final Ticker _ticker;
  StreamSubscription<MetroTicked> _tickerSubscription;

  MetroBloc({@required Ticker ticker})
      : assert(ticker != null),
        _ticker = ticker,
        super(MetroOff());

  @override
  Stream<MetroState> mapEventToState(MetroEvent event) async* {
    if (event is MetroInitialized) {
      yield* _mapMetroRunnedToState(event);
    } else if (event is MetroTicked) {
      yield* _mapMetroTickedToState(event);
    } else {
      yield* _mapMetroStoppedToState();
    }
  }

  @override
  Future<void> close() {
    _tickerSubscription.cancel();
    return super.close();
  }

  Stream<MetroState> _mapMetroRunnedToState(MetroInitialized initEvent) async* {
    yield MetroOn(0);
    _tickerSubscription?.cancel();
    _tickerSubscription = _ticker.tick(initEvent.speed).listen((event) {
      print(event.count);
      add(MetroTicked(count: event.count));
    });
  }

  Stream<MetroState> _mapMetroTickedToState(MetroTicked event) async* {
    yield MetroOn(event.count);
  }

  Stream<MetroState> _mapMetroStoppedToState() async* {
    yield MetroOff();
    _tickerSubscription?.cancel();
  }
}
