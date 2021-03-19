import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_metronome/metronome/metronome.dart';

class MetroView extends StatefulWidget {
  @override
  _MetroViewState createState() => _MetroViewState();
}

class _MetroViewState extends State<MetroView> {
  var _sliderValue = 40.0;
  void _onChange(var value) {
    setState(() {
      _sliderValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
          child: BlocBuilder<MetroBloc, MetroState>(
        builder: (context, state) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DotWidget(
              speed: _sliderValue / 60,
              isOn: true,
            ),
            Text(
              "speed: ${_sliderValue.floor()}",
              style: textTheme.headline3,
            )
          ],
        ),
      )),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          BlocBuilder<MetroBloc, MetroState>(
            buildWhen: (previousState, currentState) => currentState.runtimeType != previousState.runtimeType,
            builder: (context, state) => SizedBox(
              height: 60,
              width: size.width - 150,
              child: Slider(
                activeColor: Theme.of(context).primaryColor,
                value: _sliderValue,
                min: 40,
                max: 208,
                onChangeEnd: (value) =>
                    BlocProvider.of<MetroBloc>(context).add(MetroInitialized(speed: _sliderValue.floor(), count: 0)),
                onChanged: (value) => _onChange(value),
              ),
            ),
          ),
          BlocBuilder<MetroBloc, MetroState>(
            buildWhen: (previousState, currentState) => currentState.runtimeType != previousState.runtimeType,
            builder: (context, state) => FloatingActionButton(
              child: Icon(state is MetroOn ? Icons.stop : Icons.play_arrow),
              onPressed: () => state is MetroOn
                  ? BlocProvider.of<MetroBloc>(context).add(MetroStopped())
                  : BlocProvider.of<MetroBloc>(context).add(MetroInitialized(speed: _sliderValue.floor(), count: 0)),
            ),
          ),
        ],
      ),
    );
  }
}
