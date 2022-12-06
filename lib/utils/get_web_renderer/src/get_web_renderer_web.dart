// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:js' as js;

bool get rendererCanvasKit {
  final dynamic r = js.context['flutterCanvasKit'];
  return r != null;
}
