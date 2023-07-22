import 'package:geolocator/geolocator.dart';

Future<Position> gotCurrentLocation() async {
  bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error("error");
  }
  LocationPermission permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error("error");
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error("error p");
  }

  return await Geolocator.getCurrentPosition();
}