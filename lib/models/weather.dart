class Weather {
  Coord coord;
  List<WeatherInfo> weatherInfo;
  String base;
  Main main;
  int visibility;
  Wind wind;
  Clouds clouds;
  int dt;
  Sys sys;
  int timezone;
  int id;
  String name;
  int cod;

  Weather({
    required this.coord,
    required this.weatherInfo,
    required this.base,
    required this.main,
    required this.visibility,
    required this.wind,
    required this.clouds,
    required this.dt,
    required this.sys,
    required this.timezone,
    required this.id,
    required this.name,
    required this.cod,
  });

  factory Weather.fromMap(Map<String, dynamic> map) {
    return Weather(
      coord: Coord.fromMap(map['coord'] as Map<String, dynamic>),
      weatherInfo: List<WeatherInfo>.from(
        (map['weather'] as List<dynamic>).map<WeatherInfo>(
          (x) => WeatherInfo.fromMap(x as Map<String, dynamic>),
        ),
      ),
      base: map['base'] as String,
      main: Main.fromMap(map['main'] as Map<String, dynamic>),
      visibility: map['visibility'] as int,
      wind: Wind.fromMap(map['wind'] as Map<String, dynamic>),
      clouds: Clouds.fromMap(map['clouds'] as Map<String, dynamic>),
      dt: map['dt'] as int,
      sys: Sys.fromMap(map['sys'] as Map<String, dynamic>),
      timezone: map['timezone'] as int,
      id: map['id'] as int,
      name: map['name'] as String,
      cod: map['cod'] as int,
    );
  }
}

class Coord {
  String lon;
  String lat;

  Coord({
    required this.lon,
    required this.lat,
  });

  factory Coord.fromMap(Map<String, dynamic> map) {
    return Coord(
      lon: map['lon'].toString(),
      lat: map['lat'].toString(),
    );
  }
}

class WeatherInfo {
  int id;
  String main;
  String description;
  String icon;

  WeatherInfo({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory WeatherInfo.fromMap(Map<String, dynamic> map) {
    return WeatherInfo(
      id: map['id'] as int,
      main: map['main'] as String,
      description: map['description'] as String,
      icon: map['icon'] as String,
    );
  }
}

class Wind {
  String speed;
  int deg;
  String gust;

  Wind({
    required this.speed,
    required this.deg,
    required this.gust,
  });

  factory Wind.fromMap(Map<String, dynamic> map) {
    return Wind(
      speed: map['speed'].toString(),
      deg: map['deg'] as int,
      gust: map['gust'].toString(),
    );
  }
}

class Clouds {
  int all;
  Clouds({
    required this.all,
  });

  factory Clouds.fromMap(Map<String, dynamic> map) {
    return Clouds(
      all: map['all'] as int,
    );
  }
}

class Sys {
  String country;
  int sunrise;
  int sunset;

  Sys({
    required this.country,
    required this.sunrise,
    required this.sunset,
  });

  factory Sys.fromMap(Map<String, dynamic> map) {
    return Sys(
      country: map['country'] as String,
      sunrise: map['sunrise'] as int,
      sunset: map['sunset'] as int,
    );
  }
}

class Main {
  String temp;
  String feelsLike;
  String tempMin;
  String tempMax;
  int pressure;
  int humidity;
  int seaLevel;
  int grndLevel;

  Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
    required this.seaLevel,
    required this.grndLevel,
  });

  factory Main.fromMap(Map<String, dynamic> map) {
    return Main(
      temp: map['temp'].toString(),
      feelsLike: map['feels_like'].toString(),
      tempMin: map['temp_min'].toString(),
      tempMax: map['temp_max'].toString(),
      pressure: map['pressure'] as int,
      humidity: map['humidity'] as int,
      seaLevel: map['sea_level'] as int,
      grndLevel: map['grnd_level'] as int,
    );
  }
}
