import 'package:flutter/material.dart';

class HourlyForecastItem extends StatelessWidget {
  final String time;
  final String temperature;
  final IconData icon;
  final currentSky;

  const HourlyForecastItem(
      {super.key,
      required this.time,
      required this.temperature,
      required this.icon,
      required this.currentSky});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Text(
              time,
              maxLines: 1,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Icon(
              icon,
              color: currentSky == 'Clouds' || currentSky == 'Rain'
                  ? const Color.fromARGB(255, 41, 123, 199)
                  : Colors.amberAccent,
            ),
            const SizedBox(height: 8),
            Text(temperature)
          ],
        ),
      ),
    );
  }
}
