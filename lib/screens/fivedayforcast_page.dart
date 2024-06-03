import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:lottie/lottie.dart';
import 'package:skycast/bloc/forcast/bloc/forcast_bloc.dart';
import 'package:skycast/functions/functions.dart';
import 'package:skycast/functions/position.dart';
import 'package:skycast/widgets/background.dart';
import 'package:skycast/widgets/weathercontainer.dart';

class FivedayForcartPage extends StatelessWidget {
   const FivedayForcartPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: determinePosition(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return BlocProvider<ForcastBloc>(
            create: (context) => ForcastBloc()
              ..add(ForcastFetchEvent(
                  position: snapshot.data
                      as Position)), // Dispatch the event to fetch forecast data
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                leading: const BackButton(
                  color: Colors.white,
                ),
                title: const Text(
                  'Five day Forcast',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 20),
                ),
              ),
              backgroundColor: Colors.black,
              body: Padding(
                padding: const EdgeInsets.fromLTRB(30, 8, 30, 8),
                child: SafeArea(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: Stack(
                      children: [
                        const BackgroundScreen(),
                        BlocBuilder<ForcastBloc, ForcastState>(
                          builder: (context, state) {
                            if (state is ForcastloadingState ||
                                state is ForcastFetchEvent) {
                              return Scaffold(
                                backgroundColor: Colors.transparent,
                                body: Center(
                                    child: Column(
                                  children: [
                                    const SizedBox(height: 200),
                                    Lottie.asset(
                                        "lib/assets/weatherloading.json"),
                                    const SizedBox(height: 200),
                                  ],
                                )),
                              );
                            }
                            if (state is ForcastSuccessState) {
                              return ListView.builder(
                                  itemCount: state.weather.length,
                                  itemBuilder: (context, index) {
                                    return WeatherContainer(
                                      temperature: state
                                          .weather[index].temperature!.celsius!,
                                      weatherConditionCode: state
                                          .weather[index].weatherConditionCode!,
                                      weatherIcon: getWeatherIcon(state
                                          .weather[index]
                                          .weatherConditionCode!),
                                      date: state.weather[index].date!,
                                      weatherMain:
                                          state.weather[index].weatherMain!,
                                    );
                                  }); // or whatever widget you want to return
                            } else {
                              return Scaffold(
                                backgroundColor: Colors.transparent,
                                body: Center(
                                    child: Column(
                                  children: [
                                    const SizedBox(height: 200),
                                    Lottie.asset(
                                        "lib/assets/weatherloading.json"),
                                    const SizedBox(height: 200),
                                  ],
                                )),
                              ); // return a default widget in case of other states
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        } else {
          return const Scaffold(
            body: BackgroundScreen(),
          );
        }
      },
    );
  }
}
