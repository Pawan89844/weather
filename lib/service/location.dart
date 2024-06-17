import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart' as location;

abstract class GeoLocation {
  Future<String> getLocation();
}

class Location implements GeoLocation {
  bool isServiceEnabled = false;
  location.LocationPermission permission = location.LocationPermission.denied;

  Future<String?> _getCoordinates() async {
    var point = await location.Geolocator.getCurrentPosition();
    List<Placemark> placemark =
        await placemarkFromCoordinates(point.latitude, point.longitude);
    return placemark[0].locality;
  }

  @override
  Future<String> getLocation() async {
    isServiceEnabled = await location.Geolocator.isLocationServiceEnabled();
    _LocationLogic.isServiceEnabled(isServiceEnabled);
    _LocationLogic.permission(permission);
    String? locality = await _getCoordinates();
    return locality as String;
  }
}

class _LocationLogic {
  static Future<Error>? isServiceEnabled(bool serviceStatus) {
    if (!serviceStatus) {
      return Future.error('Location services are disabled');
    }
    return null;
  }

  static Future<location.LocationPermission> permission(
      location.LocationPermission permission) async {
    permission = await location.Geolocator.checkPermission();
    switch (permission) {
      case location.LocationPermission.denied:
        permission = await location.Geolocator.requestPermission();
        break;
      case location.LocationPermission.deniedForever:
        Future.error('Location services are forever denied');
      default:
        permission = await location.Geolocator.requestPermission();
    }
    return permission;
  }
}
