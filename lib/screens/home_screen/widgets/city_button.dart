import 'package:flutter/material.dart';

class CityButton extends StatelessWidget {
  final String cityName;
  final Function() navigateToWeather;

  const CityButton(
      {super.key, required this.cityName, required this.navigateToWeather});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: navigateToWeather,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(12),
        shape: const BeveledRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5))),
        side: const BorderSide(color: Colors.blue, width: 0.5),
      ),
      child: Center(
          child: Text(
        cityName,
        style: const TextStyle(color: Colors.blue),
      )),
    );
  }
}
