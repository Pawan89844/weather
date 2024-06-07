import 'package:html/dom.dart';
import 'package:weather/module/home/model/weather_data_model.dart';
import 'package:weather/network/network.dart';
import 'package:html/parser.dart';

class HomeAPI extends RESTAPI {
  Map<String, dynamic> _storeData(List<Element> city, List<Element> temp,
      List<Element> icon, List<Element> forecast) {
    return {
      'city': city.isNotEmpty ? city[0].text : '',
      'temp': temp.isNotEmpty ? temp[0].text : '',
      'icon': icon.isNotEmpty
          ? '${_APIURL._baseUrl}${icon[0].attributes['data-src']}'
          : '',
      'hourly_temperature': forecast,
    };
  }

  WeatherDataModel _getWeather(Document weather) {
    final city = weather.getElementsByClassName(_HTMLClassSelector.city);
    final temp = weather.getElementsByClassName(_HTMLClassSelector.temp);
    final icon = weather.getElementsByClassName(_HTMLClassSelector.icon);
    final forecast =
        weather.getElementsByClassName(_HTMLClassSelector.forecast);
    final html = _storeData(city, temp, icon, forecast);
    WeatherDataModel realtimeWeather = WeatherDataModel.fromHTML(html);
    return realtimeWeather;
  }

  Future<WeatherDataModel?> scrapWeatherReport() async {
    final api = await super.get(_APIURL.getTemperature);
    if (api.statusCode == 200) {
      var weather = parse(api.body);
      return _getWeather(weather);
    }
    return null;
  }
}

class _APIURL {
  static const String _baseUrl = 'https://www.accuweather.com';
  static String getTemperature =
      '$_baseUrl/en/in/faridabad/202446/weather-forecast/202446?city=faridabad';
}

class _HTMLClassSelector {
  static const String city = 'header-loc';
  static const String temp = 'temp';
  static const String icon = 'weather-icon';
  static const String forecast = 'hourly-list__list';
}
