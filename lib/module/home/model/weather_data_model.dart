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
    List<TemperatureList> temp = List.generate(
        forecast.length, (index) => TemperatureList.fromHTML(html));
    return WeatherDataModel(
        temperature: html['temp'],
        city: html['city'],
        weatherIcon: html['icon'],
        temperatureList: temp);
  }
}

class TemperatureList {
  final List<String> temp;
  final String icon;
  final List<String> time;
  final List<Color> cardColor;

  TemperatureList(
      {required this.temp,
      required this.icon,
      required this.time,
      required this.cardColor});

  factory TemperatureList.fromHTML(Map<String, dynamic> html) {
    var forecast = (html['hourly_temperature'] as List<tag.Element>);
    List<String> time = _WeatherDataLogic.constructTime(forecast);
    List<Color> colors = List.generate(
        time.length,
        (index) => Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
            .withOpacity(1.0));
    List<String> temperatur = _WeatherDataLogic.constructTemperature(forecast);
    return TemperatureList(
        temp: temperatur, icon: html['icon'], time: time, cardColor: colors);
  }
}

/// [_WeatherDataLogic] class contains all String extraction logic such as Time and Temperature string
final class _WeatherDataLogic {
  static String _hour = '';
  static final List<String> _data = [];
  static final List<String> _temp = [];

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

  static _modifyTemp(List<String> newString) {
    for (final element in newString) {
      if (element.endsWith('°')) {
        _temp.add(element);
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

  static List<String> constructTemperature(List<tag.Element> forecast) {
    for (int i = 0; i < forecast.length; i++) {
      String replacedString =
          forecast[i].text.trim().replaceAll(RegExp(r'\s+'), ' ');
      List<String> newString = replacedString.split(' ');
      _modifyTemp(newString);
    }
    return _temp;
  }
}
