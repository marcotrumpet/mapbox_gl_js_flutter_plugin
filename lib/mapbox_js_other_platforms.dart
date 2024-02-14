String stringify(dynamic obj) => throw UnimplementedError();
void consoleLog(dynamic obj) => throw UnimplementedError();

class MapboxJS {
  external MapboxJS(options);

  external void addSource(String id, dynamic options);

  external dynamic getSource(String id);

  external dynamic removeSource(String id);

  external void addLayer(dynamic layer);

  external dynamic getLayer(String id);

  external void moveLayer(String layerId);

  external void removeLayer(String layerId);

  external dynamic on(
    String method,
    dynamic Function(dynamic) callback,
  );

  external dynamic setData(dynamic options);

  external void triggerRepaint();

  external void setCenter(List<num> coords);

  external LngLatBounds getBounds();

  external bool loaded();

  external void setLayoutProperty(
    String layerId,
    String property,
    dynamic value,
  );

  external dynamic getPaintProperty(
    String layerId,
    String property,
  );

  external void zoomTo(num zoom);

  external num getZoom();

  external dynamic queryRenderedFeatures(List<num> coords);

  external void easeTo(dynamic options);

  external void flyTo(dynamic options);

  external dynamic cameraForBounds(
    List<List<num>> bbox,
    dynamic options,
  );

  external void addControl(GeolocateControl conrtol);
}

class LngLatBounds {
  external factory LngLatBounds();

  external dynamic getNorthEast();
  external dynamic getSouthWest();
}

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

class GeolocateControl {
  external factory GeolocateControl();

  external dynamic Function(dynamic map) onAdd;
  external void Function() onRemove;
  external bool Function() trigger;
}

extension MapToJSObject on Map<dynamic, dynamic> {
  dynamic mapToJsObject() => throw UnimplementedError();
}

dynamic myDartify(dynamic obj) => throw UnimplementedError();
dynamic myJsfy(Object? obj) => throw UnimplementedError();

extension JsProperty on dynamic {
  dynamic getMyProperty(String property) {
    return throw UnimplementedError();
  }
}

Map<dynamic, dynamic> jsObjectToMap(dynamic jsObject) =>
    throw UnimplementedError();

List<String>? objectKeys(dynamic jsObject) => throw UnimplementedError();

// ignore: unused_element
external List<String> _objectKeys(dynamic jsObject);
