import 'dart:math' as math;
import 'package:html/dom.dart' as tag;
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
    var forecast = (html['hourly_temperature'] as List<tag.Element>);
    List<String> time = _WeatherDataLogic.constructTime(forecast);
    print('Time: $time');
    return WeatherDataModel(
      temperature: html['temp'],
      city: html['city'],
      weatherIcon: html['icon'],
    );
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

final class _WeatherDataLogic {
  static String _hour = '';
  static List<String> _data = [];

  static _modifyString(List<String> newString) {
    for (final element in newString) {
      if (element == 'AM' || element == 'PM') {
        _hour = element;
      } else {
        int? time = int.tryParse(element);
        if (time != null) {
          _data.add('$time$_hour');
        }
      }
    }
  }

  static List<String> constructTime(List<tag.Element> forecast) {
    for (int i = 0; i < forecast.length; i++) {
      String replacedString =
          forecast[i].text.trim().replaceAll(RegExp(r'\s+'), ' ');
      List<String> newString = replacedString.split(' ');
      _modifyString(newString);
    }
    return _data;
  }
}
