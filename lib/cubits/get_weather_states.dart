import 'package:weather_app/models/weather_model.dart';

abstract class Weatherstate {}

class WeatherInitialState extends Weatherstate {}

class WeatherLoadingState extends Weatherstate {}

class WeatherLoadedState extends Weatherstate {
  final WeatherModel weatherModel;
  WeatherLoadedState(this.weatherModel);
}

class WeatherErrorState extends Weatherstate {
  final String error;
  WeatherErrorState(this.error);
}
