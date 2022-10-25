import 'dart:convert';

class Weather {
  Coord? coord;
  List<WeatherInfo>? weather;
  String? base;
  Main? main;
  int? visibility;
  Wind? wind;
  Clouds? clouds;
  int? dt;
  Sys? sys;
  int? timezone;
  int? id;
  String? name;
  int? cod;

  Weather({
    this.coord,
    this.weather,
    this.base,
    this.main,
    this.visibility,
    this.wind,
    this.clouds,
    this.dt,
    this.sys,
    this.timezone,
    this.id,
    this.name,
    this.cod,
  });

  factory Weather.fromMap(Map<String, dynamic> map) {
    return Weather(
      coord: map['coord'] != null
          ? Coord.fromMap(map['coord'] as Map<String, dynamic>)
          : null,
      weather: map['weather'] != null
          ? List<WeatherInfo>.from(
              (map['weather'] as List<dynamic>).map<WeatherInfo?>(
                (x) => WeatherInfo.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      base: map['base'] != null ? map['base'] as String : null,
      main: map['main'] != null
          ? Main.fromMap(map['main'] as Map<String, dynamic>)
          : null,
      visibility: map['visibility'] != null ? map['visibility'] as int : null,
      wind: map['wind'] != null
          ? Wind.fromMap(map['wind'] as Map<String, dynamic>)
          : null,
      clouds: map['clouds'] != null
          ? Clouds.fromMap(map['clouds'] as Map<String, dynamic>)
          : null,
      dt: map['dt'] != null ? map['dt'] as int : null,
      sys: map['sys'] != null
          ? Sys.fromMap(map['sys'] as Map<String, dynamic>)
          : null,
      timezone: map['timezone'] != null ? map['timezone'] as int : null,
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      cod: map['cod'] != null ? map['cod'] as int : null,
    );
  }
}

class Coord {
  double? lon;
  double? lat;

  Coord({
    this.lon,
    this.lat,
  });

  factory Coord.fromMap(Map<String, dynamic> map) {
    return Coord(
      lon: map['lon'] != null ? map['lon'] as double : null,
      lat: map['lat'] != null ? map['lat'] as double : null,
    );
  }
}

class WeatherInfo {
  int? id;
  String? main;
  String? description;
  String? icon;

  WeatherInfo({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  factory WeatherInfo.fromMap(Map<String, dynamic> map) {
    return WeatherInfo(
      id: map['id'] != null ? map['id'] as int : null,
      main: map['main'] != null ? map['main'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      icon: map['icon'] != null ? map['icon'] as String : null,
    );
  }
}

class Wind {
  double? speed;
  int? deg;
  double? gust;

  Wind({
    this.speed,
    this.deg,
    this.gust,
  });

  factory Wind.fromMap(Map<String, dynamic> map) {
    return Wind(
      speed: map['speed'] != null ? map['speed'] as double : null,
      deg: map['deg'] != null ? map['deg'] as int : null,
      gust: map['gust'] != null ? map['gust'] as double : null,
    );
  }
}

class Clouds {
  int? all;

  Clouds({
    this.all,
  });

  factory Clouds.fromMap(Map<String, dynamic> map) {
    return Clouds(
      all: map['all'] != null ? map['all'] as int : null,
    );
  }
}

class Sys {
  String? country;
  int? sunrise;
  int? sunset;

  Sys({
    this.country,
    this.sunrise,
    this.sunset,
  });

  factory Sys.fromMap(Map<String, dynamic> map) {
    return Sys(
      country: map['country'] != null ? map['country'] as String : null,
      sunrise: map['sunrise'] != null ? map['sunrise'] as int : null,
      sunset: map['sunset'] != null ? map['sunset'] as int : null,
    );
  }
}

class Main {
  double? temp;
  double? feelsLike;
  double? tempMin;
  double? tempMax;
  int? pressure;
  int? humidity;
  int? seaLevel;
  int? grndLevel;

  Main({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.humidity,
    this.seaLevel,
    this.grndLevel,
  });

  factory Main.fromMap(Map<String, dynamic> map) {
    return Main(
      temp: map['temp'] != null ? map['temp'] as double : null,
      feelsLike: map['feels_like'] != null ? map['feels_like'] as double : null,
      tempMin: map['temp_min'] != null ? map['temp_min'] as double : null,
      tempMax: map['temp_max'] != null ? map['temp_max'] as double : null,
      pressure: map['pressure'] != null ? map['pressure'] as int : null,
      humidity: map['humidity'] != null ? map['humidity'] as int : null,
      seaLevel: map['sea_level'] != null ? map['sea_level'] as int : null,
      grndLevel: map['grnd_level'] != null ? map['grnd_level'] as int : null,
    );
  }
}
