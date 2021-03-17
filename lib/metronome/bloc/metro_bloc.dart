import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_metronome/metronome/metronome.dart';
import 'package:flutter_metronome/ticker.dart';

class MetroBloc extends Bloc<MetroEvent, MetroState> {
  final Ticker _ticker;
  StreamSubscription<MetroTicked> _tickerSubscription;

  MetroBloc({@required Ticker ticker})
      : assert(ticker != null),
        _ticker = ticker,
        super(MetroOff());

  @override
  Stream<MetroState> mapEventToState(MetroEvent event) async* {
    if (event is MetroRunned) {
      yield* _mapMetroRunnedToState(event);
    } else if (event is MetroTicked) {
      yield* _mapMetroTickedToState();
    } else {
      yield* _mapMetroStoppedToState();
    }
  }

  @override
  Future<void> close() {
    _tickerSubscription.cancel();
    return super.close();
  }

  Stream<MetroState> _mapMetroRunnedToState(MetroRunned runEvent) async* {
    yield MetroOn();
    _tickerSubscription?.cancel();
    _tickerSubscription = _ticker.tick(runEvent.speed).listen((event) => add(MetroTicked()));
  }

  Stream<MetroState> _mapMetroTickedToState() async* {
    yield MetroOn();
  }

  Stream<MetroState> _mapMetroStoppedToState() async* {
    yield MetroOff();
  }
}
