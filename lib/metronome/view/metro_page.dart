import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_metronome/metronome/metronome.dart';
import 'package:flutter_metronome/ticker.dart';

class MetroPage extends StatelessWidget {
  const MetroPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MetroBloc(
        ticker: Ticker(),
      ),
      child: MetroView(),
    );
  }
}
