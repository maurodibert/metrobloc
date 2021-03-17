import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_metronome/metronome/metronome.dart';

class MetroView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MetroBloc, MetroState>(
        builder: (context, state) => Center(
          child: Text('Metronome $state'),
        ),
      ),
    );
  }
}
