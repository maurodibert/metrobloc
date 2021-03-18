import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_metronome/metronome/metronome.dart';

class MetroView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MetroBloc metroBloc = BlocProvider.of<MetroBloc>(context);
    return Scaffold(
      body: Center(
        child: BlocBuilder<MetroBloc, MetroState>(
          builder: (context, state) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Metronome $state'),
            ],
          ),
        ),
      ),
      floatingActionButton: BlocBuilder<MetroBloc, MetroState>(
        buildWhen: (previousState, currentState) => currentState.runtimeType != previousState.runtimeType,
        builder: (context, state) => FloatingActionButton(
          child: Icon(state is MetroOn ? Icons.stop : Icons.play_arrow),
          onPressed: () =>
              state is MetroOn ? metroBloc.add(MetroStopped()) : metroBloc.add(MetroInitialized(speed: 90, count: 0)),
        ),
      ),
    );
  }
}
