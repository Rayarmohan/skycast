import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:lottie/lottie.dart';
import 'package:skycast/bloc/forcast/bloc/forcast_bloc.dart';
import 'package:skycast/bloc/weather/weather_bloc.dart';
import 'package:skycast/functions/position.dart';
import 'package:skycast/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WeatherBloc>(
          create: (context) => WeatherBloc(),
        ),
        BlocProvider<ForcastBloc>(
          create: (context) => ForcastBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Sky Cast',
        theme: ThemeData(
            primaryColor: Colors.white,
            colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.deepPurple, secondary: Colors.white),
            useMaterial3: true,
            textTheme: const TextTheme(
              displayLarge: TextStyle(color: Colors.white),
              displayMedium: TextStyle(color: Colors.white),
              displaySmall: TextStyle(color: Colors.white),
              headlineLarge: TextStyle(color: Colors.white),
              headlineMedium: TextStyle(color: Colors.white),
              headlineSmall: TextStyle(color: Colors.white),
              titleSmall: TextStyle(color: Colors.white),
              titleMedium: TextStyle(color: Colors.white),
              titleLarge: TextStyle(color: Colors.white),
              bodyLarge: TextStyle(color: Colors.white),
              bodyMedium: TextStyle(color: Colors.white),
              bodySmall: TextStyle(color: Colors.white), // Medium headline
            )),
        home: FutureBuilder(
          future: determinePosition(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return BlocProvider<WeatherBloc>(
                create: (context) => WeatherBloc()
                  ..add(FetchWeatherEvent(position: snapshot.data as Position)),
                child: const HomePage(),
              );
            } else {
              return Scaffold(
                backgroundColor: Colors.black,
                body: Center(
                    child: Column(
                  children: [
                    const SizedBox(height: 200),
                    Lottie.asset("lib/assets/weatherloading.json"),
                    const SizedBox(height: 200),
                    const Text(
                      "PoweredBy",
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                    SizedBox(
                      height: 40,
                      width: 125,
                      child: Image.asset(
                        "lib/assets/openweather.png",
                      ),
                    )
                  ],
                )),
              );
            }
          },
        ),
      ),
    );
  }
}

