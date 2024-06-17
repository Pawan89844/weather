import 'package:flutter/material.dart';
import 'package:weather/module/home/model/weather_data_model.dart';
import 'package:weather/service/home/home_api.dart';
import 'package:weather/service/location.dart';

class HomeViewModel extends ChangeNotifier {
  WeatherDataModel? weather;
  final HomeAPI _homeAPI = HomeAPI();
  final Location _location = Location();
  String locality = '';

  void setWeather() async {
    WeatherDataModel? report = await _homeAPI.scrapWeatherReport();
    weather = report;
    notifyListeners();
  }

  void getLocation() async {
    String loc = await _location.getLocation();
    locality = loc;
    notifyListeners();
  }
}
