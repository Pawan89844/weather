import 'package:flutter/material.dart';
import 'package:weather/network/home/home_api.dart';
import 'package:weather/widgets/app_text.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeAPI _api = HomeAPI();
  @override
  void initState() {
    super.initState();
    _api.scrapWeatherReport();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const AppText('Weather Forecast')),
      body: Column(
        children: [
          SizedBox.square(
            dimension: 200.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.cloud),
                Container(
                  alignment: Alignment.center,
                  child: const AppText(
                    '31.0°',
                    isBoldText: true,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: const AppText('Faridabad, Haryana'),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(vertical: 14.0),
            width: 200.0,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AppText('Today'),
                AppText('Tomorrow'),
                AppText('After'),
              ],
            ),
          ),
          Container(
            height: 150.0,
            margin: const EdgeInsets.only(bottom: 14.0),
            width: double.infinity,
            child: ListView.builder(
              itemCount: 3,
              primary: false,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 12.0),
              itemBuilder: (context, i) {
                return Card(
                  color: i == 0
                      ? Colors.orange
                      : i == 1
                          ? Colors.brown
                          : Colors.grey,
                  child: Container(
                    height: 120.0,
                    alignment: Alignment.center,
                    width: 75.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const AppText('18:00', color: Colors.white),
                        Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(top: 14.0),
                            child:
                                const Icon(Icons.cloud, color: Colors.white)),
                        Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(top: 14.0),
                          child: const AppText(
                            '12°',
                            isBoldText: true,
                            fontSize: 18.0,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 10.0),
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.symmetric(horizontal: 14.0),
            child: const AppText(
              'Additional Info',
              isBoldText: true,
              fontWeight: FontWeight.w700,
              fontSize: 20.0,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Card(
                  child: Container(
                      alignment: Alignment.centerLeft,
                      child: const Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: 8.0, right: 14.0, top: 14.0),
                            child: Row(
                              children: [
                                AppText('Wind ',
                                    isBoldText: true, fontSize: 18.0),
                                AppText('38 Km',
                                    isBoldText: true, fontSize: 18.0),
                                Spacer(),
                                AppText('Humidity ',
                                    isBoldText: true, fontSize: 18.0),
                                AppText('55%',
                                    isBoldText: true, fontSize: 18.0),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 8.0, right: 14.0, top: 14.0),
                            child: Row(
                              children: [
                                AppText('Visibility ',
                                    isBoldText: true, fontSize: 18.0),
                                AppText('25 Km',
                                    isBoldText: true, fontSize: 18.0),
                                Spacer(),
                                AppText('UV ',
                                    isBoldText: true, fontSize: 18.0),
                                AppText('1', isBoldText: true, fontSize: 18.0),
                              ],
                            ),
                          ),
                          SizedBox(height: 8.0),
                        ],
                      )),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
