import 'dart:math' as math;

import 'package:flutter/material.dart';

class WeatherDataModel {
  final String temperature;
  final String weatherIcon;
  final String city;
  final List<TemperatureList>? temperatureList;

  WeatherDataModel(
      {required this.temperature,
      required this.weatherIcon,
      required this.city,
      this.temperatureList});

  factory WeatherDataModel.fromHTML(Map<String, dynamic> html) {
    return WeatherDataModel(
        temperature: html['temp'],
        city: html['city'],
        weatherIcon: html['icon']);
  }
}

class TemperatureList {
  final String temp;
  final String icon;
  final String time;
  final Color cardColor;

  TemperatureList(
      {required this.temp,
      required this.icon,
      required this.time,
      required this.cardColor});

  factory TemperatureList.fromHTML(Map<String, dynamic> html) {
    return TemperatureList(
        temp: html['temp'],
        icon: html['icon'],
        time: html['time'],
        cardColor: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
            .withOpacity(1.0));
  }
}
