import 'package:flutter/material.dart';
import 'package:weather/module/home/view%20model/home_view_model.dart';
import 'package:weather/module/home/view/home_view.dart';
import 'package:weather/style/app_theme.dart';
import 'package:provider/provider.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather',
      theme: MyTheme().selectedTheme(),
      home: ChangeNotifierProvider(
        create: (context) => HomeViewModel()
          ..setWeather()
          ..getLocation(),
        child: const HomeView(),
      ),
    );
  }
}
