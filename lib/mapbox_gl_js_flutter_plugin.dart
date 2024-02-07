
import 'mapbox_gl_js_flutter_plugin_platform_interface.dart';

class MapboxGlJsFlutterPlugin {
  Future<String?> getPlatformVersion() {
    return MapboxGlJsFlutterPluginPlatform.instance.getPlatformVersion();
  }
}
