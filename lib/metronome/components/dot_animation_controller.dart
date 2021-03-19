import 'package:rive/rive.dart';

class DotAnimation extends SimpleAnimation {
  DotAnimation(String animationName) : super(animationName);

  start(double speed) {
    instance.animation.loop = Loop.loop;
    instance.animation.speed = speed;
    isActive = true;
  }

  off() {
    instance.animation.loop = Loop.oneShot;
  }

  setSpeed(double speed) {}
}
