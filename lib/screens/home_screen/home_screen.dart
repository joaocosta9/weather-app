import 'package:flutter/material.dart';
import 'package:weather_app/constants/cities.constants.dart';
import 'package:weather_app/screens/home_screen/widgets/city_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
        ),
        body: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                CityButton(
                    cityName: "Current location",
                    navigateToWeather: () => Navigator.pushNamed(
                        context, "/city_info",
                        arguments: {"cityName": "Current Location"})),
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
            navigateToWeather: () => Navigator.pushNamed(context, "/city_info",
                arguments: {"cityName": CitiesConstants.cities[index]}));
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}
