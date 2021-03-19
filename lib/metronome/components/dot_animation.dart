import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_metronome/metronome/components/dot_animation_controller.dart';
import 'package:flutter_metronome/metronome/metronome.dart';
import 'package:rive/rive.dart';

class DotWidget extends StatefulWidget {
  final double speed;
  final bool isOn;

  const DotWidget({Key key, this.speed, @required this.isOn}) : super(key: key);

  @override
  _DotWidgetState createState() => _DotWidgetState();
}

class _DotWidgetState extends State<DotWidget> {
  final riveFileName = 'animations/metronome.riv';
  Artboard _artboard;
  DotAnimation _dotController;
  // bool _isDotOn = false;

  @override
  void initState() {
    _loadRiveFile();
    super.initState();
  }

  void _loadRiveFile() async {
    final bytes = await rootBundle.load(riveFileName);
    final file = RiveFile();

    if (file.import(bytes)) {
      _dotController = DotAnimation('on');
      setState(() => _artboard = file.mainArtboard..addController(_dotController));
      _dotController.off();
    }
  }

  // void _turnOn(bool isDotOn) {
  //   if (_dotController == null) {
  //     _artboard.addController(
  //       _dotController = DotAnimation('ticking'),
  //     );
  //   }
  //   if (_isDotOn) {
  //     _dotController.setSpeed(60);
  //   }
  // }

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
                    _dotController.start(widget.speed);
                  });
                } else if (state is MetroOff) {
                  setState(() {
                    _dotController.off();
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
