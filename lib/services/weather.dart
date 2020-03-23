import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:clima/services/location.dart';

const String apiKey = "84c473c02f4553ef62248c3dd70f7724";
const String openWeatherMapUrl =
    "https://api.openweathermap.org/data/2.5/weather";

class WeatherModel {
  final Location _loc = Location();

  Future<dynamic> getLocationWeather() async {
    await _loc.getCurrentLocation();
    var request =
        "$openWeatherMapUrl?lat=${_loc.latitude}&lon=${_loc.longitude}&APPID=$apiKey&units=imperial";
    print(request);
    NetworkingHelper network = NetworkingHelper(request);
    var weatherData = await network.getData();

    return weatherData;
  }

  Future<dynamic> getCityWeather(String cityName) async {
    var request = "$openWeatherMapUrl?q=$cityName&APPID=$apiKey&units=imperial";
    print(request);
    NetworkingHelper network = NetworkingHelper(request);
    var weatherData = await network.getData();

    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
