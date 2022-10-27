import 'package:flutter/material.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/utils/date_time_utils.dart';

class WeatherAdditionalInfo extends StatelessWidget {
  final Wind wind;
  final Sys sys;
  final Main weatherMain;
  const WeatherAdditionalInfo(
      {super.key,
      required this.wind,
      required this.sys,
      required this.weatherMain});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              infoText('Wind speed: ${wind.speed} m/s'),
              infoText('Wind direction: ${wind.deg}º'),
              infoText('Wind gust: ${wind.gust}')
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              infoText('Humidity: ${weatherMain.humidity}%'),
              infoText(
                  'Sunrise: ${DateTimeUtils.getTimeFromTimestamp(sys.sunrise)}'),
              infoText(
                  'Sunset: ${DateTimeUtils.getTimeFromTimestamp(sys.sunset)}'),
            ],
          ),
        )
      ],
    );
  }

  Padding infoText(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 10),
      child:
          Text(text, style: const TextStyle(fontSize: 13, color: Colors.white)),
    );
  }
}
