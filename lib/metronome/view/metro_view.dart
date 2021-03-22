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
    Color primaryColor = Theme.of(context).primaryColor;

    return BlocBuilder<MetroBloc, MetroState>(
      builder: (context, state) => Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'MetroBloc',
                style: TextStyle(fontFamily: 'Staatiches Regular', color: primaryColor, fontSize: 72),
              ),
              Container(
                color: primaryColor,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: RichText(
                    text: TextSpan(
                      text: 'by ',
                      style: TextStyle(fontFamily: 'Source Sans Pro', color: Colors.white),
                      children: <TextSpan>[
                        TextSpan(text: '@maurodibert', style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
              ),
              MetroWidget(
                speed: _sliderValue / 120,
                isOn: true,
              ),
            ],
          ),
        ),
        floatingActionButton: SizedBox(
          width: 460,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 10,
              ),
              Text(_sliderValue.floor().toString(),
                  style: Theme.of(context).textTheme.headline5.copyWith(
                        color: primaryColor,
                        fontFamily: 'Staatiches Regular',
                      )),
              SizedBox(
                width: 10,
              ),
              SizedBox(
                height: 60,
                child: Slider(
                  divisions: 84,
                  activeColor: primaryColor,
                  value: _sliderValue,
                  min: 40,
                  max: 208,
                  onChangeEnd: (value) =>
                      BlocProvider.of<MetroBloc>(context).add(MetroInitialized(speed: _sliderValue.floor(), count: 0)),
                  onChanged: (value) => _onChange(value),
                ),
              ),
              FloatingActionButton(
                child: Icon(state is MetroOn ? Icons.stop : Icons.play_arrow),
                onPressed: () => state is MetroOn
                    ? BlocProvider.of<MetroBloc>(context).add(MetroStopped())
                    : BlocProvider.of<MetroBloc>(context).add(MetroInitialized(speed: _sliderValue.floor(), count: 0)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
