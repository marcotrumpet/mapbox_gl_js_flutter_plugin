/// this library
library mapbox_gl_js_flutter_plugin;

import 'package:flutter/widgets.dart';
import 'package:mapbox_gl_js_flutter_plugin/flutter_initialization.dart' // Stub implementation
    if (dart.library.io) 'package:mapbox_gl_js_flutter_plugin/flutter_other_initialization.dart' // dart:io implementation
    if (dart.library.html) 'package:mapbox_gl_js_flutter_plugin/flutter_web_initialization.dart';

export 'mapbox_js_other_platforms.dart'
    if (dart.library.io) 'mapbox_js_other_platforms.dart'
    if (dart.library.html) 'mapbox_js.dart';

class MapboxGLJSPlugin {
  MapboxGLJSPlugin({
    required this.viewType,
    required this.uniqueMapKey,
    this.containerId = 'map',
    this.onPlatformViewCreated,
  });

  final String viewType;
  final UniqueKey uniqueMapKey;
  final String containerId;
  final void Function(int)? onPlatformViewCreated;

  void initialize() {
    init(viewType, containerId);
  }

  Widget htmlElementView() {
    return HtmlElementView(
      viewType: viewType,
      key: uniqueMapKey,
      onPlatformViewCreated: onPlatformViewCreated,
    );
  }
}
