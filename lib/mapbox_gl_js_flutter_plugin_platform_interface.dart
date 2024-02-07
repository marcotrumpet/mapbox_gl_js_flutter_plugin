import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'mapbox_gl_js_flutter_plugin_method_channel.dart';

abstract class MapboxGlJsFlutterPluginPlatform extends PlatformInterface {
  /// Constructs a MapboxGlJsFlutterPluginPlatform.
  MapboxGlJsFlutterPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static MapboxGlJsFlutterPluginPlatform _instance = MethodChannelMapboxGlJsFlutterPlugin();

  /// The default instance of [MapboxGlJsFlutterPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelMapboxGlJsFlutterPlugin].
  static MapboxGlJsFlutterPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [MapboxGlJsFlutterPluginPlatform] when
  /// they register themselves.
  static set instance(MapboxGlJsFlutterPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
