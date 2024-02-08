@JS()
library mapboxgl;

import 'dart:core' as core;
// ignore: avoid_web_libraries_in_flutter
import 'dart:js';
// ignore: avoid_web_libraries_in_flutter
import 'dart:js_util' as js_util;

import 'package:js/js.dart';
import 'package:js/js_util.dart';

@JS('JSON.stringify')
external core.String stringify(core.dynamic obj);

@JS('console.log')
external void consoleLog(core.dynamic obj);

@JS('mapboxgl')
external Map get map;

@JS('mapboxgl.Map')
class Map {
  external Map(options);

  @JS()
  external void addSource(core.String id, core.dynamic options);

  @JS()
  external core.dynamic getSource(core.String id);

  @JS()
  external core.dynamic removeSource(core.String id);

  @JS()
  external void addLayer(JsObject layer);

  @JS()
  external core.dynamic getLayer(core.String id);

  @JS()
  external void moveLayer(core.String layerId);

  @JS()
  external void removeLayer(core.String layerId);

  @JS()
  external core.dynamic on(
    core.String method,
    core.dynamic Function(core.dynamic) callback,
  );

  @JS()
  external JsObject setData(JsObject options);

  @JS()
  external void triggerRepaint();

  @JS()
  external void setCenter(core.List<core.num> coords);

  @JS()
  external core.bool loaded();

  @JS()
  external void setLayoutProperty(
    core.String layerId,
    core.String property,
    core.dynamic value,
  );

  @JS()
  external core.dynamic getPaintProperty(
    core.String layerId,
    core.String property,
  );

  @JS()
  external void zoomTo(core.num zoom);

  @JS()
  external core.num getZoom();

  @JS()
  external core.dynamic queryRenderedFeatures(
    core.List<core.num> coords,
  );

  @JS()
  external void easeTo(JsObject options);
}

@JS()
@anonymous
class MapOptions {
  external factory MapOptions({
    core.String container,
    core.String accessToken,
    core.List<core.num> center,
    core.num zoom,
    core.String style,
    core.String language,
  });
}

extension MapToJSObject on core.Map<core.dynamic, core.dynamic> {
  JsObject mapToJsObject() {
    final object = js_util.newObject<JsObject>();
    forEach((k, v) {
      if (v is core.Map<core.dynamic, core.dynamic>) {
        js_util.setProperty(object, k.toString(), v.mapToJsObject());
      } else {
        js_util.setProperty(object, k.toString(), v);
      }
    });
    return object;
  }
}

core.Object? myDartify(core.dynamic obj) {
  return dartify(obj);
}
