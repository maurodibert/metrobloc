import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_metronome/metronome/components/metro_animation.dart';
import 'package:flutter_metronome/metronome/metronome.dart';
import 'package:rive/rive.dart';

class MetroWidget extends StatefulWidget {
  final double speed;
  final bool isOn;

  const MetroWidget({Key key, this.speed, @required this.isOn}) : super(key: key);

  @override
  _MetroWidgetState createState() => _MetroWidgetState();
}

class _MetroWidgetState extends State<MetroWidget> {
  final riveFileName = 'animations/metronome.riv';
  Artboard _artboard;
  MetroAnimation _metroController;

  @override
  void initState() {
    _loadRiveFile();
    super.initState();
  }

  void _loadRiveFile() async {
    final bytes = await rootBundle.load(riveFileName);
    final file = RiveFile();

    if (file.import(bytes)) {
      _metroController = MetroAnimation('on');
      setState(() => _artboard = file.mainArtboard..addController(_metroController));
      _metroController.off();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      height: 500,
      child: _artboard != null
          ? BlocListener<MetroBloc, MetroState>(
              listener: (context, state) {
                if (state is MetroOn) {
                  setState(() {
                    _metroController.start(widget.speed);
                  });
                } else if (state is MetroOff) {
                  setState(() {
                    _metroController.off();
                  });
                }
              },
              child: Rive(
                artboard: _artboard,
              ),
            )
          : Container(),
    );
  }
}
