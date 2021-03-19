import 'dart:js' as js;

void playAudio(String path) {
  js.context.callMethod('playAudio', [path]);
}
