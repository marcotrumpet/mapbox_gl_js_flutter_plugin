import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'mapbox_gl_js_flutter_plugin_platform_interface.dart';

/// An implementation of [MapboxGlJsFlutterPluginPlatform] that uses method channels.
class MethodChannelMapboxGlJsFlutterPlugin extends MapboxGlJsFlutterPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('mapbox_gl_js_flutter_plugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
