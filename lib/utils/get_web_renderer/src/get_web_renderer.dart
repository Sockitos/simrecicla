import 'get_web_renderer_stub.dart'
    if (dart.library.html) 'get_web_renderer_web.dart';

bool get isCanvasKit => rendererCanvasKit;
