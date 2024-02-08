import 'package:flutter/material.dart';

Widget getWeatherIcon(int code) {
  switch (code) {
    case > 200 && < 300:
      return Image.asset("lib/assets/thunderstrom.png");
    case > 300 && < 325:
      return Image.asset("lib/assets/dizzle.png");
    case > 500 && < 535:
      return Image.asset("lib/assets/rain.png");
    case > 600 && < 625:
      return Image.asset("lib/assets/snow.png");
    case > 700 && < 785:
      return Image.asset("lib/assets/mist.png");
    case 800:
      return Image.asset("lib/assets/clouds.png");
    case > 800 && < 805:
      return Image.asset("lib/assets/fewclouds.png");
    default:
      return Image.asset("lib/assets/thunderstrom.png");
  }
}

Widget greeting() {
  DateTime now = DateTime.now();
  int hour = now.hour;

  // Determine greeting based on current time
  if (hour < 12) {
    return const Text(
      'Good Morning',
      style: TextStyle(fontWeight: FontWeight.w400, fontSize: 25),
    );
  } else if (hour < 18) {
    return const Text(
      'Good Afternoon',
      style: TextStyle(fontWeight: FontWeight.w400, fontSize: 25),
    );
  } else {
    return const Text(
      'Good Evening',
      style: TextStyle(fontWeight: FontWeight.w400, fontSize: 25),
    );
  }
}

