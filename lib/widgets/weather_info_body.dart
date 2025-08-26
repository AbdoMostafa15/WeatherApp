import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    WeatherModel? weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            changeColor(weatherModel!.weathercondition).shade900,
            changeColor(weatherModel.weathercondition).shade300,
            changeColor(weatherModel.weathercondition).shade50,
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weatherModel.cityname,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
            Text(
              weatherModel.date,
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network("https:${weatherModel.image}"
                    // weatherModel.image.toString(),
                    ),
                Text(
                  weatherModel.temp.round().toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      weatherModel.maxtemp.round().toString(),
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      weatherModel.mintemp.round().toString(),
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              weatherModel.weathercondition,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

MaterialColor changeColor(String condition) {
  switch (condition.trim().toLowerCase()) {
    case "sunny":
      return Colors.orange;
    case "partly cloudy":
      return Colors.blue;
    case "clear":
      return Colors.indigo;
    case "overcast":
      return Colors.grey;
    case "rain":
    case "light rain":
    case "moderate rain":
    case "heavy rain":
      return Colors.blueGrey;
    case "snow":
    case "light snow":
    case "moderate snow":
    case "heavy snow":
      return Colors.cyan;
    case "thunderstorm":
      return Colors.deepPurple;
    default:
      return Colors.teal;
  }
}
