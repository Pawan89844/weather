import 'package:weather/network/network.dart';
import 'package:html/parser.dart';

class HomeAPI extends RESTAPI {
  final String _url =
      'https://www.accuweather.com/en/in/faridabad/202446/weather-forecast/202446?city=faridabad';

  void scrapWeatherReport() async {
    final api = await super.get(_url);
    if (api.statusCode == 200) {
      // print('Status: ${api.body}');
      // var weather = parse(api.body);
      // print('Weather: ${weather.getElementsByClassName(weather.documentElement!.className)}');
    }
  }
}
