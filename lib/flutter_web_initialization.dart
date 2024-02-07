// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'dart:ui_web';

void init(String viewType, String containerId) {
  platformViewRegistry.registerViewFactory(
    viewType,
    (int id) => DivElement()
      ..id = containerId
      ..style.width = '100%'
      ..style.height = '100%'
      ..style.border = 'none',
  );
}
