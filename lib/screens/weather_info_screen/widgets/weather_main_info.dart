import 'package:flutter/material.dart';
import 'package:weather_app/models/weather.dart';

class WeatherMainInfo extends StatefulWidget {
  final Main weatherMain;
  final WeatherInfo weatherInfo;
  const WeatherMainInfo(
      {super.key, required this.weatherMain, required this.weatherInfo});

  @override
  State<WeatherMainInfo> createState() => _WeatherMainInfoState();
}

class _WeatherMainInfoState extends State<WeatherMainInfo> {
  bool expandInfo = false;

  @override
  Widget build(BuildContext context) {
    final String imageUrl =
        "http://openweathermap.org/img/wn/${widget.weatherInfo.icon}@2x.png";
    return Row(
      children: [
        Expanded(
            flex: 2,
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        "${widget.weatherMain.temp}ºC",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 28,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Wrap(
                spacing: 5,
                runSpacing: 5,
                children: [
                  Wrap(
                    spacing: 5,
                    runSpacing: 5,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      const Icon(
                        Icons.arrow_upward,
                        color: Colors.white,
                      ),
                      Text(
                        '${widget.weatherMain.tempMax}ºC ',
                        style:
                            const TextStyle(fontSize: 13, color: Colors.white),
                      ),
                    ],
                  ),
                  Wrap(
                    spacing: 5,
                    runSpacing: 5,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      const Icon(
                        Icons.arrow_downward,
                        color: Colors.white,
                      ),
                      Text(
                        '${widget.weatherMain.tempMin}ºC',
                        style:
                            const TextStyle(fontSize: 13, color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ])),
        Expanded(
          flex: 1,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(imageUrl),
              Text(
                widget.weatherInfo.main,
                style: const TextStyle(fontSize: 23, color: Colors.white),
              )
            ],
          ),
        )
      ],
    );
  }
}
