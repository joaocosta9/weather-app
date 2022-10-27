import 'package:flutter/material.dart';
import 'package:weather_app/screens/weather_info_screen/weather_info_screen.dart';
import 'package:weather_app/screens/home_screen/home_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    T? getArgument<T>(String key) => (settings.arguments as Map?)?[key];

    switch (settings.name) {
      case RoutePaths.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case RoutePaths.cityInfo:
        return MaterialPageRoute(
            builder: (_) => CityInfoScreen(
                  cityName: getArgument(CityInfoScreen.cityNameKey),
                  isCurrentLocation:
                      getArgument(CityInfoScreen.isCurrentLocationKey),
                ));
      default:
        return _errorRoute();
    }
  }
}

Route<dynamic> _errorRoute() {
  return MaterialPageRoute(builder: (_) {
    return Scaffold(
        appBar: AppBar(title: const Text("Error")),
        body: const Center(child: Text("Error")));
  });
}

class RoutePaths {
  static const String home = '/home';
  static const String cityInfo = '/city_info';
}
