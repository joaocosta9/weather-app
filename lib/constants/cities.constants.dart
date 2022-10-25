import 'package:weather_app/models/weather.dart';

class CitiesConstants {
  static const String lisbon = "Lisbon";
  static const String madrid = "Madrid";
  static const String paris = "Paris";
  static const String berlim = "Berlim";
  static const String rome = "Rome";
  static const String london = "London";
  static const String dublin = "Dublin";
  static const String prague = "Prague";
  static const String viena = "Viena";

  static const List<String> cities = [
    lisbon,
    madrid,
    paris,
    berlim,
    rome,
    london,
    dublin,
    prague,
    viena
  ];

  static final Map<String, Coord> coordinates = {
    lisbon: Coord(lat: 38.695927, lon: -9.194453),
    madrid: Coord(lat: 40.4168, lon: 3.7038),
    paris: Coord(lat: 48.8566, lon: 2.3522),
    berlim: Coord(lat: 52.52, lon: 13.4050),
    rome: Coord(lat: 41.9028, lon: 12.4964),
    london: Coord(lat: 51.5072, lon: 0.1276),
    dublin: Coord(lat: 53.3498, lon: 6.2603),
    prague: Coord(lat: 50.0755, lon: 14.4378),
    viena: Coord(lat: 48.2082, lon: 16.3738)
  };
}
