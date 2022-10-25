import 'package:dio/dio.dart';

class BaseService {
  final Dio dio = Dio(BaseOptions(
      baseUrl: "https://api.openweathermap.org",
      headers: {
        "Accept": "*/*",
        "Content-Type": "application/json",
        "Connection": "keep-alive",
      },
      connectTimeout: 10000,
      receiveTimeout: 10000));
}
