import 'package:weather_app/models/weather.dart';

import 'package:geolocator/geolocator.dart';

class LocationUtils {
  static Future<Coord> getCurrentPosition() async {
    try {
      await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      String lon = position.longitude.toString();
      String lat = position.latitude.toString();
      return Coord(lon: lon, lat: lat);
    } catch (e) {
      throw Exception("Error");
    }
  }
}
