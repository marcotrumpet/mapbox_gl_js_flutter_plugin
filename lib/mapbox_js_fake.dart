import 'dart:core' as core;

core.String stringify(core.dynamic obj) => throw core.UnimplementedError();
void consoleLog(core.dynamic obj) => throw core.UnimplementedError();

class Map {
  external Map(options);

  external void addSource(core.String id, core.dynamic options);

  external core.dynamic getSource(core.String id);

  external core.dynamic removeSource(core.String id);

  external void addLayer(core.dynamic layer);

  external core.dynamic getLayer(core.String id);

  external void moveLayer(core.String layerId);

  external void removeLayer(core.String layerId);

  external core.dynamic on(
    core.String method,
    core.dynamic Function(core.dynamic) callback,
  );

  external core.dynamic setData(core.dynamic options);

  external void triggerRepaint();

  external void setCenter(core.List<core.num> coords);

  external core.bool loaded();

  external void setLayoutProperty(
    core.String layerId,
    core.String property,
    core.dynamic value,
  );

  external core.dynamic getPaintProperty(
    core.String layerId,
    core.String property,
  );

  external void zoomTo(core.num zoom);

  external core.num getZoom();

  external core.dynamic queryRenderedFeatures(core.List<core.num> coords);

  external void easeTo(core.dynamic options);
}

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
  core.dynamic mapToJsObject() => throw core.UnimplementedError();
}

core.Object? myDartify(core.dynamic obj) => throw core.UnimplementedError();
