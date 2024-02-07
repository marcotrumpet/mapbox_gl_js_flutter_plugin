import 'package:flutter_test/flutter_test.dart';
import 'package:mapbox_gl_js_flutter_plugin/mapbox_gl_js_flutter_plugin.dart';
import 'package:mapbox_gl_js_flutter_plugin/mapbox_gl_js_flutter_plugin_platform_interface.dart';
import 'package:mapbox_gl_js_flutter_plugin/mapbox_gl_js_flutter_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockMapboxGlJsFlutterPluginPlatform
    with MockPlatformInterfaceMixin
    implements MapboxGlJsFlutterPluginPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final MapboxGlJsFlutterPluginPlatform initialPlatform = MapboxGlJsFlutterPluginPlatform.instance;

  test('$MethodChannelMapboxGlJsFlutterPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelMapboxGlJsFlutterPlugin>());
  });

  test('getPlatformVersion', () async {
    MapboxGlJsFlutterPlugin mapboxGlJsFlutterPlugin = MapboxGlJsFlutterPlugin();
    MockMapboxGlJsFlutterPluginPlatform fakePlatform = MockMapboxGlJsFlutterPluginPlatform();
    MapboxGlJsFlutterPluginPlatform.instance = fakePlatform;

    expect(await mapboxGlJsFlutterPlugin.getPlatformVersion(), '42');
  });
}
