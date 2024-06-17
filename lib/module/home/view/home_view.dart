import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:weather/module/home/view%20model/home_view_model.dart';
import 'package:weather/widgets/app_text.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const AppText('Weather Forecast')),
      body: Consumer<HomeViewModel>(
        builder: (context, value, __) {
          if (value.weather == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Column(
              children: [
                SizedBox.square(
                  dimension: 200.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          alignment: Alignment.center,
                          height: 50.0,
                          child: SvgPicture.network(
                              value.weather?.weatherIcon as String)),
                      Container(
                        alignment: Alignment.center,
                        child: AppText(
                          value.weather?.temperature as String,
                          isBoldText: true,
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: AppText(value.weather?.city as String),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                // Container(
                //   alignment: Alignment.centerLeft,
                //   margin: const EdgeInsets.symmetric(
                //       vertical: 14.0, horizontal: 14.0),
                //   // width: 200.0,
                //   child: const AppText(
                //     'Hourly Report',
                //     isBoldText: true,
                //     fontSize: 20.0,
                //   ),
                // ),
                Container(
                  height: 150.0,
                  margin: const EdgeInsets.only(bottom: 14.0),
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: value.weather?.temperatureList?[0].time.length,
                    primary: false,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.only(left: 12.0),
                    itemBuilder: (context, i) {
                      final forecast =
                          value.weather?.temperatureList?[0].time[i];
                      return Card(
                        color: value.weather?.temperatureList?[0].cardColor[i],
                        child: Container(
                          height: 120.0,
                          alignment: Alignment.center,
                          width: 75.0,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AppText(forecast as String, color: Colors.white),
                              Container(
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.only(top: 14.0),
                                  child: const Icon(Icons.cloud,
                                      color: Colors.white)),
                              Container(
                                alignment: Alignment.center,
                                margin: const EdgeInsets.only(top: 14.0),
                                child: AppText(
                                  value.weather?.temperatureList?[0].temp[i]
                                      as String,
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
                // const SizedBox(height: 10.0),
                // Container(
                //   alignment: Alignment.centerLeft,
                //   margin: const EdgeInsets.symmetric(horizontal: 14.0),
                //   child: const AppText(
                //     'Additional Info',
                //     isBoldText: true,
                //     fontWeight: FontWeight.w700,
                //     fontSize: 20.0,
                //   ),
                // ),
                // Column(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     Padding(
                //       padding: const EdgeInsets.all(12.0),
                //       child: Card(
                //         child: Container(
                //             alignment: Alignment.centerLeft,
                //             child: const Column(
                //               children: [
                //                 Padding(
                //                   padding: EdgeInsets.only(
                //                       left: 8.0, right: 14.0, top: 14.0),
                //                   child: Row(
                //                     children: [
                //                       AppText('Wind ',
                //                           isBoldText: true, fontSize: 18.0),
                //                       AppText('38 Km',
                //                           isBoldText: true, fontSize: 18.0),
                //                       Spacer(),
                //                       AppText('Humidity ',
                //                           isBoldText: true, fontSize: 18.0),
                //                       AppText('55%',
                //                           isBoldText: true, fontSize: 18.0),
                //                     ],
                //                   ),
                //                 ),
                //                 Padding(
                //                   padding: EdgeInsets.only(
                //                       left: 8.0, right: 14.0, top: 14.0),
                //                   child: Row(
                //                     children: [
                //                       AppText('Visibility ',
                //                           isBoldText: true, fontSize: 18.0),
                //                       AppText('25 Km',
                //                           isBoldText: true, fontSize: 18.0),
                //                       Spacer(),
                //                       AppText('UV ',
                //                           isBoldText: true, fontSize: 18.0),
                //                       AppText('1',
                //                           isBoldText: true, fontSize: 18.0),
                //                     ],
                //                   ),
                //                 ),
                //                 SizedBox(height: 8.0),
                //               ],
                //             )),
                //       ),
                //     ),
                //   ],
                // )
              ],
            );
          }
        },
      ),
    );
  }
}
