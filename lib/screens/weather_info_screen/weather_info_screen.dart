import 'package:flutter/material.dart';
import 'package:weather_app/constants/cities_constants.dart';
import 'package:weather_app/data/services/weather_service.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/screens/weather_info_screen/widgets/weather_info_box.dart';
import 'package:weather_app/utils/location_utils.dart';

class CityInfoScreen extends StatefulWidget {
  static const String cityNameKey = 'cityName';
  static const String isCurrentLocationKey = 'isCurrentLocationKey';

  const CityInfoScreen(
      {super.key, required this.cityName, this.isCurrentLocation});
  final String cityName;
  final bool? isCurrentLocation;
  @override
  State<CityInfoScreen> createState() => _CityInfoScreenState();
}

class _CityInfoScreenState extends State<CityInfoScreen> {
  late Future<Weather?> weatherFuture;

  @override
  void initState() {
    super.initState();
    weatherFuture = getData();
  }

  Future<Weather?> getData() async {
    Coord coord;
    if (widget.isCurrentLocation != null) {
      coord = await LocationUtils.getCurrentPosition();
    } else {
      coord = CitiesConstants.coordinates[widget.cityName]!;
    }
    return await WeatherService().getWeatherData(coord);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blue,
          title: Text(widget.cityName),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.refresh),
          onPressed: () => setState(() {
            weatherFuture = getData();
          }),
        ),
        body: FutureBuilder<Weather?>(
            future: weatherFuture,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Center(
                  child: Text(
                    "Error",
                    style: TextStyle(fontSize: 20),
                  ),
                );
              } else if (snapshot.hasData) {
                Weather weather = snapshot.data!;
                return WeatherInfoBox(weather: weather);
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }
}
