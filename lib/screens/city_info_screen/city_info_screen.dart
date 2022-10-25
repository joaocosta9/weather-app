import 'package:flutter/material.dart';
import 'package:weather_app/constants/cities.constants.dart';
import 'package:weather_app/data/services/weather_service.dart';
import 'package:weather_app/models/weather.dart';

class CityInfoScreen extends StatefulWidget {
  const CityInfoScreen({super.key, required this.cityName});
  final String cityName;
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
    Coord coord = CitiesConstants.coordinates[widget.cityName]!;
    return await WeatherService().getWeatherData(coord);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
                return const Text("Error");
              } else if (snapshot.hasData) {
                Weather weather = snapshot.data!;
                return Text(weather.name!);
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }
}
