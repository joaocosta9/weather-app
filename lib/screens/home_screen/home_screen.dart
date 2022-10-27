import 'package:flutter/material.dart';
import 'package:weather_app/constants/cities_constants.dart';
import 'package:weather_app/router.dart';
import 'package:weather_app/screens/home_screen/widgets/city_button.dart';
import 'package:weather_app/screens/weather_info_screen/weather_info_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.blue,
            title: const Text("Home"),
            automaticallyImplyLeading: false),
        body: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                CityButton(
                    cityName: CitiesConstants.currentLocation,
                    navigateToWeather: () => Navigator.pushNamed(
                            context, RoutePaths.cityInfo,
                            arguments: {
                              CityInfoScreen.cityNameKey:
                                  CitiesConstants.currentLocation,
                              CityInfoScreen.isCurrentLocationKey: true
                            })),
                const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Cities",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                    )),
                Expanded(child: cities())
              ],
            )));
  }

  ListView cities() {
    return ListView.separated(
      itemCount: CitiesConstants.cities.length,
      itemBuilder: (BuildContext context, int index) {
        return CityButton(
            cityName: CitiesConstants.cities[index],
            navigateToWeather: () => Navigator.pushNamed(
                    context, RoutePaths.cityInfo, arguments: {
                  CityInfoScreen.cityNameKey: CitiesConstants.cities[index]
                }));
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}
