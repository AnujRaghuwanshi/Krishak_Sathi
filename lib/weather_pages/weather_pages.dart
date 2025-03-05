import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:krishak_sathi/constant.dart';

import 'package:krishak_sathi/weather_pages/secrets.dart';
import 'package:krishak_sathi/weather_pages/hourly_forecast.dart';
import 'package:krishak_sathi/weather_pages/additional_information.dart';
import 'package:http/http.dart' as http;

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({
    super.key,
  });

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  void initState() {
    super.initState();
    getCurrentweather();
  }

  Future getCurrentweather() async {
    // String cityName = 'London';
    try {
      final res = await http.get(Uri.parse(
          'https://api.openweathermap.org/data/2.5/forecast?q=Bhopal,IN&APPID=$APIKey'));

      final data = jsonDecode(res.body);

      if (data['cod'] != '200') {
        throw 'An error occurred';
      }

      return data;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getCurrentweather(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        }

        final data = snapshot.data!;
        final currentTemp = data['list'][0]['main']['temp'];
        final currentSky = data['list'][1]['weather'][0]['main'];
        final currentSpeed = data['list'][1]['wind']['speed'];
        final currentHumidity = data['list'][0]['main']['humidity'];
        final currentPressure = data['list'][0]['main']['pressure'];

        return Scaffold(
          appBar: AppBar(
            backgroundColor: GobalColors.PrimaryColor,
            foregroundColor: Colors.white,
            leading: Transform.scale(
              scale: 0.9,
              child: const Padding(
                padding: const EdgeInsets.only(left: 33),
              ),
            ),
            centerTitle: true,
            title: const Text(
              'Weather App',
              style: TextStyle(),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  setState(() {});
                },
                icon: const Icon(Icons.refresh, color: Colors.white),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  elevation: 1000,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Text(
                            ' $currentTemp K',
                            style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(
                            currentSky == 'Clouds' || currentSky == 'Rain'
                                ? Icons.cloud
                                : Icons.sunny,
                            size: 50,
                            color:
                                currentSky == 'Clouds' || currentSky == 'Rain'
                                    ? const Color.fromARGB(255, 41, 123, 199)
                                    : Colors.amberAccent,
                          ),
                          Text(
                            currentSky,
                            style: const TextStyle(fontSize: 20),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                //weather forecast

                const Text(
                  'Weather Forecast',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: 140,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 30,
                    itemBuilder: (context, index) {
                      final hourlyForecast = data['list'][index + 1];
                      final time = DateTime.parse(hourlyForecast['dt_txt']);

                      final hourlySky =
                          data['list'][index + 1]['weather'][0]['main'];
                      return HourlyForecastItem(
                        time: DateFormat('j').format(time),
                        temperature: hourlyForecast['main']['temp'].toString(),
                        icon: hourlySky == 'Clouds' || hourlySky == 'Rain'
                            ? Icons.cloud
                            : Icons.sunny,
                        currentSky: currentSky.toString(),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Additional information",
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AdditionalInformation(
                      icon: Icons.water_drop,
                      label: "Humidity",
                      value: "$currentHumidity",
                    ),
                    AdditionalInformation(
                      icon: Icons.air,
                      label: "Wind speed",
                      value: "$currentSpeed",
                    ),
                    AdditionalInformation(
                      icon: Icons.beach_access,
                      label: "Pressure",
                      value: "$currentPressure",
                    ),
                  ],
                ),
                const Text(
                  'Location',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Card(
                      elevation: 10,
                      child: Container(
                        width: 370,
                        height: 70,
                        decoration: const BoxDecoration(
                          color: GobalColors.PrimaryColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(14),
                          ),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Bhopal',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            )
                          ],
                        ),
                      ),
                    )
                    // Placeholder(
                    //   fallbackHeight: 60,
                    //   fallbackWidth: 330,
                    // )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
