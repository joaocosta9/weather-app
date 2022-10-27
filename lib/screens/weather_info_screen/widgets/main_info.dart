import 'package:flutter/material.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/utils/date_time_utils.dart';

class MainInfo extends StatefulWidget {
  final int dateTime;
  final Main weatherMain;
  final WeatherInfo weatherInfo;
  const MainInfo(
      {super.key,
      required this.dateTime,
      required this.weatherMain,
      required this.weatherInfo});

  @override
  State<MainInfo> createState() => _MainInfoState();
}

class _MainInfoState extends State<MainInfo> {
  bool expandInfo = false;

  @override
  Widget build(BuildContext context) {
    final String imageUrl =
        "http://openweathermap.org/img/wn/${widget.weatherInfo.icon}@2x.png";
    final String dateTimeF = DateTimeUtils.timestampToDateTime(widget.dateTime);
    return Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(15),
        width: double.infinity,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.blue),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              dateTimeF,
              style: const TextStyle(
                fontSize: 17,
                color: Colors.white,
              ),
            ),
            Row(
              children: [
                Expanded(
                    flex: 2,
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${widget.weatherMain.temp}ºC",
                              style: const TextStyle(
                                fontSize: 28,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.arrow_upward,
                            color: Colors.white,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5, right: 5),
                            child: Text(
                              '${widget.weatherMain.tempMax}ºC',
                              style: const TextStyle(
                                  fontSize: 13, color: Colors.white),
                            ),
                          ),
                          const Icon(
                            Icons.arrow_downward,
                            color: Colors.white,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5, right: 5),
                            child: Text(
                              '${widget.weatherMain.tempMin}ºC',
                              style: const TextStyle(
                                  fontSize: 13, color: Colors.white),
                            ),
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
                        style:
                            const TextStyle(fontSize: 23, color: Colors.white),
                      )
                    ],
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton.icon(
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
                            color: Colors.white,
                            width: 1,
                            style: BorderStyle.solid)),
                  ),
                  onPressed: () => setState(() {
                    expandInfo = !expandInfo;
                  }),
                  label: Text(
                    "${expandInfo ? "Hide" : "More"} info",
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
