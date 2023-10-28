/*
Future<void> addMarkers() async {
  _markers.clear();
  final Uint8List customMarker = await getBytesFromAsset(
      path: locationMarkerIcon, //paste the custom image path
      width: 100 // size of custom image as marker
  );
  _markers.add(
    Marker(
        onDragEnd: ((newPosition) {
          updateMapCameraPosition(
              LatLng(newPosition.latitude, newPosition.longitude));
        }),
        draggable: _isAddressAdd,
        markerId: const MarkerId("1"),
        position: _initialCameraPosition,
        icon: BitmapDescriptor.fromBytes(customMarker) //Icon for Marker
    ),
  );
}

Future<Uint8List> getBytesFromAsset(
    {required String path, required int width}) async {
  ByteData data = await rootBundle.load(path);
  ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
      targetWidth: width);
  ui.FrameInfo fi = await codec.getNextFrame();
  return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
      .buffer
      .asUint8List();
}*/
