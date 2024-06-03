import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:skycast/bloc/weather/weather_bloc.dart';
import 'package:skycast/functions/functions.dart';
import 'package:skycast/screens/fivedayforcast_page.dart';
import 'package:skycast/widgets/background.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 8, 30, 8),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              const BackgroundScreen(),
              BlocBuilder<WeatherBloc, WeatherState>(
                builder: (context, state) {
                  if (state is WeatherSuccessState) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '📍${state.weather.areaName}',
                            style: const TextStyle(fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(height: 10),
                          greeting(),
                          getWeatherIcon(state.weather.weatherConditionCode!),
                          Center(
                            child: Text(
                              '${state.weather.temperature!.celsius!.round()}° C',
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 55),
                            ),
                          ),
                          Center(
                            child: Text(
                              state.weather.weatherMain!.toUpperCase(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 25),
                            ),
                          ),
                          Center(
                            child: Text(
                              DateFormat('EEEE dd ·')
                                  .add_jm()
                                  .format(state.weather.date!),
                              style: const TextStyle(
                                  fontWeight: FontWeight.w300, fontSize: 16),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    "lib/assets/sunny.png",
                                    scale: 8,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Sunrise',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w300),
                                      ),
                                      Text(
                                        DateFormat()
                                            .add_jm()
                                            .format(state.weather.sunrise!),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    "lib/assets/moon.png",
                                    scale: 8,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Sunset',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w300),
                                      ),
                                      Text(
                                        DateFormat()
                                            .add_jm()
                                            .format(state.weather.sunset!),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 5.0),
                            child: Divider(
                              color: Colors.grey,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    "lib/assets/hightemp.png",
                                    scale: 8,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'High Temp',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w300),
                                      ),
                                      Text(
                                        '${state.weather.tempMax!.celsius!.round()}° C',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    "lib/assets/lowtemp.png",
                                    scale: 8,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Low Temp',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w300),
                                      ),
                                      Text(
                                        '${state.weather.tempMin!.celsius!.round()}° C',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (ctx) =>
                                            const FivedayForcartPage()),
                                  );
                                },
                                style: ButtonStyle(
                                  elevation: MaterialStateProperty.all(8),
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.grey[200]!.withOpacity(0.5)),
                                  padding: MaterialStateProperty.all(
                                      const EdgeInsets.only(
                                          left: 55,
                                          right: 55,
                                          top: 15,
                                          bottom: 15)),
                                ),
                                child: const Text(
                                  "5 day forcast",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
