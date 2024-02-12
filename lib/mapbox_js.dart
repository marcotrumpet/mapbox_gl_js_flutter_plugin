@JS()
library mapboxgl;

// ignore: avoid_web_libraries_in_flutter
import 'dart:js';
// ignore: avoid_web_libraries_in_flutter
import 'dart:js_util' as js_util;

import 'package:js/js.dart';
import 'package:js/js_util.dart';

@JS('JSON.stringify')
external String stringify(dynamic obj);

@JS('console.log')
external void consoleLog(dynamic obj);

@JS('mapboxgl')
external MapboxJS get map;

@JS('mapboxgl.Map')
class MapboxJS {
  external MapboxJS(options);

  @JS()
  external void addSource(String id, dynamic options);

  @JS()
  external dynamic getSource(String id);

  @JS()
  external dynamic removeSource(String id);

  @JS()
  external void addLayer(JsObject layer);

  @JS()
  external dynamic getLayer(String id);

  @JS()
  external void moveLayer(String layerId);

  @JS()
  external void removeLayer(String layerId);

  @JS()
  external dynamic on(
    String method,
    dynamic Function(dynamic) callback,
  );

  @JS()
  external JsObject setData(JsObject options);

  @JS()
  external void triggerRepaint();

  @JS()
  external void setCenter(List<num> coords);

  @JS()
  external bool loaded();

  @JS()
  external void setLayoutProperty(
    String layerId,
    String property,
    dynamic value,
  );

  @JS()
  external dynamic getPaintProperty(
    String layerId,
    String property,
  );

  @JS()
  external void zoomTo(num zoom);

  @JS()
  external num getZoom();

  @JS()
  external dynamic queryRenderedFeatures(
    List<num> coords,
  );

  @JS()
  external void easeTo(JsObject options);

  @JS()
  external void flyTo(JsObject options);

  @JS()
  external JsObject cameraForBounds(
    List<List<num>> bbox,
    JsObject options,
  );

  @JS()
  external void addControl(GeolocateControl conrtol);
}

@JS()
@anonymous
class MapOptions {
  external factory MapOptions({
    String container,
    String accessToken,
    List<num> center,
    num zoom,
    String style,
    String language,
  });
}

@JS('mapboxgl.GeolocateControl')
class GeolocateControl {
  external factory GeolocateControl();

  @JS()
  external dynamic Function(dynamic map) onAdd;

  @JS()
  external void Function() onRemove;

  @JS()
  external bool Function() trigger;
}

extension MapToJSObject on Map<dynamic, dynamic> {
  JsObject mapToJsObject() {
    final object = js_util.newObject<JsObject>();
    forEach((k, v) {
      if (v is Map<dynamic, dynamic>) {
        js_util.setProperty(object, k.toString(), v.mapToJsObject());
      } else {
        js_util.setProperty(object, k.toString(), v);
      }
    });
    return object;
  }
}

Object? myDartify(dynamic obj) {
  return dartify(obj);
}
