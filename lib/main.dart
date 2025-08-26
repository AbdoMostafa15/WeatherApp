import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_states.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, Weatherstate>(
          builder: (context, state) {
            String? condition;

            if (state is WeatherLoadedState) {
              condition = state.weatherModel.weathercondition;
            }

            final color = changeColor(condition ?? "default");

            return MaterialApp(
              debugShowCheckedModeBanner: false,
              key: ValueKey(condition),
              theme: ThemeData(
                primarySwatch: color,
                appBarTheme: AppBarTheme(
                  backgroundColor: color,
                  foregroundColor: Colors.white,
                ),
                elevatedButtonTheme: ElevatedButtonThemeData(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: color,
                    foregroundColor: Colors.white,
                  ),
                ),
                floatingActionButtonTheme: FloatingActionButtonThemeData(
                  backgroundColor: color,
                  foregroundColor: Colors.white,
                ),
              ),
              home: const HomeView(),
            );
          },
        ),
      ),
    );
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
}
