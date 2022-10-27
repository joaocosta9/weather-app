import 'package:dio/dio.dart';
import 'package:weather_app/data/services/base_service.dart';
import 'package:weather_app/models/weather.dart';

class WeatherService {
  final BaseService service = BaseService();
  static const String apiKey = "3f9a1094d4c265864cc129d1ffc26eda";

  Future<Weather> getWeatherData(Coord coord) async {
    try {
      String lat = coord.lat;
      String lon = coord.lon;
      Response response = await service.dio.request(
          "/data/2.5/weather?lat=$lat&lon=$lon&units=metric&appid=$apiKey",
          options: Options(method: "get"));
      return Weather.fromMap(response.data);
    } on DioError {
      throw Exception("Error");
    }
  }
}
