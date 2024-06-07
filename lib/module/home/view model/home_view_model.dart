import 'package:flutter/material.dart';
import 'package:weather/module/home/model/weather_data_model.dart';
import 'package:weather/network/home/home_api.dart';

class HomeViewModel extends ChangeNotifier {
  WeatherDataModel? weather;
  final HomeAPI _homeAPI = HomeAPI();

  void setWeather() async {
    WeatherDataModel? report = await _homeAPI.scrapWeatherReport();
    weather = report;
    notifyListeners();
  }
}
