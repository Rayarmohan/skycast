import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WeatherContainer extends StatelessWidget {
  final double temperature;
  final int weatherConditionCode;
  final String weatherMain;
  final DateTime date;
  final Widget weatherIcon;

  const WeatherContainer({
    Key? key,
    required this.temperature,
    required this.weatherConditionCode,
    required this.weatherMain,
    required this.date,
    required this.weatherIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey[100]!.withOpacity(0.2),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      '${temperature.round()}° C',
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 20),
                    ),
                    SizedBox(height: 60, width: 60, child: weatherIcon),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      weatherMain.toUpperCase(),
                      style: const TextStyle(
                          fontWeight: FontWeight.w300, fontSize: 20),
                    ),
                    Text(
                      DateFormat('EEEE dd ·').add_jm().format(date),
                      style: const TextStyle(
                          fontWeight: FontWeight.w300, fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
