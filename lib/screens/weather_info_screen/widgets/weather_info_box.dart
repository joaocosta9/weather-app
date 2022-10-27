import 'package:weather_app/models/weather.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/screens/weather_info_screen/widgets/weather_additional_info.dart';
import 'package:weather_app/screens/weather_info_screen/widgets/weather_main_info.dart';
import 'package:weather_app/utils/date_time_utils.dart';
import 'package:weather_app/widgets/expandable_info.dart';

class WeatherInfoBox extends StatefulWidget {
  final Weather weather;
  const WeatherInfoBox({super.key, required this.weather});

  @override
  State<WeatherInfoBox> createState() => _WeatherInfoBoxState();
}

class _WeatherInfoBoxState extends State<WeatherInfoBox> {
  bool expandInfo = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(15),
      width: double.infinity,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.blue),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        title(),
        WeatherMainInfo(
            weatherMain: widget.weather.main,
            weatherInfo: widget.weather.weatherInfo[0]),
        Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [moreInfoButton()],
            )),
        ExpandableInfo(
          shallExpand: expandInfo,
          child: WeatherAdditionalInfo(
            sys: widget.weather.sys,
            wind: widget.weather.wind,
            weatherMain: widget.weather.main,
          ),
        )
      ]),
    );
  }

  Text title() {
    final String dateTime =
        DateTimeUtils.timestampToDateTime(widget.weather.dt);
    return Text(dateTime,
        style: const TextStyle(
          fontSize: 17,
          color: Colors.white,
        ));
  }

  TextButton moreInfoButton() {
    return TextButton.icon(
      icon: Icon(
        expandInfo ? Icons.arrow_upward : Icons.arrow_downward,
        color: Colors.white,
        size: 24.0,
      ),
      style: TextButton.styleFrom(
        backgroundColor: Colors.grey,
        padding: const EdgeInsets.only(left: 20, right: 20),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: const BorderSide(
                color: Colors.white, width: 1, style: BorderStyle.solid)),
      ),
      onPressed: () => setState(() {
        expandInfo = !expandInfo;
      }),
      label: Text(
        "${expandInfo ? "Hide" : "More"} info",
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
