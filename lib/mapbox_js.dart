@JS()
library mapboxgl;

import 'dart:js_interop';

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
  external void addLayer(dynamic layer);

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
  external JSObject setData(JSObject options);

  @JS()
  external void triggerRepaint();

  @JS()
  external void setCenter(List<num> coords);

  @JS()
  external LngLatBounds getBounds();

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
  external JSObject queryRenderedFeatures(
    List<num> coords,
  );

  @JS()
  external void easeTo(JSObject options);

  @JS()
  external void flyTo(JSObject options);

  @JS()
  external JSObject cameraForBounds(
    List<List<num>> bbox,
    JSObject options,
  );

  @JS()
  external void addControl(GeolocateControl conrtol);

  @JS()
  external void addImage(String name, dynamic imageData);

  @JS()
  external void loadImage(
    String url,
    dynamic Function(dynamic, dynamic) callback,
  );
}

@JS()
@anonymous
class LngLatBounds {
  external factory LngLatBounds();

  @JS()
  external JSObject getNorthEast();

  @JS()
  external JSObject getSouthWest();
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

@JS('mapboxgl.Marker')
class MarkerGLJS {
  external factory MarkerGLJS(dynamic el);

  @JS()
  external dynamic Function(dynamic coordinates) setLngLat;

  @JS()
  external dynamic Function(dynamic map) addTo;
}

extension MapToJSObject on Map<dynamic, dynamic> {
  JSObject mapToJsObject() {
    final object = newObject<JSObject>();
    forEach((k, v) {
      if (v is Map<dynamic, dynamic>) {
        setProperty(object, k.toString(), v.mapToJsObject());
      } else {
        setProperty(object, k.toString(), v);
      }
    });
    return object;
  }
}

Object? myDartify(Object? o) => dartify(o);

dynamic myJsfy(Object? obj) {
  return jsify(obj);
}

extension JsProperty on dynamic {
  dynamic getMyProperty(String property) {
    if (this is! JSObject) return;
    return getProperty<dynamic>(this as JSObject, property);
  }
}

Map<dynamic, dynamic> jsObjectToMap(JSObject jsObject) {
  final result = <dynamic, dynamic>{};
  final keys = _objectKeys(jsObject);
  for (final key in keys) {
    if (!key.startsWith('_') && key != 'originalEvent' && key != 'target') {
      final dynamic value = getProperty<dynamic>(jsObject, key);
      final nestedKeys = objectKeys(value);
      if ((nestedKeys ?? []).isNotEmpty) {
        //nested property
        result[key] = jsObjectToMap(value as JSObject);
      } else {
        result[key] = value;
      }
    }
  }
  return result;
}

List<String>? objectKeys(dynamic jsObject) {
  if (jsObject == null ||
      jsObject is String ||
      jsObject is num ||
      jsObject is bool) {
    return null;
  }
  return _objectKeys(jsObject);
}

@JS('Object.keys')
external List<String> _objectKeys(dynamic jsObject);
