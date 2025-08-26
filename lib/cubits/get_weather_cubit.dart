import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_states.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/service/weather_servies.dart';

class GetWeatherCubit extends Cubit<Weatherstate> {
  WeatherModel? weatherModel;

  GetWeatherCubit() : super(WeatherInitialState());

  Future<void> getWeatherNews(String city) async {
    emit(WeatherLoadingState());
    try {
      weatherModel = await WeatherServies().getWeatherNews(city: city);
      emit(WeatherLoadedState(weatherModel!));
    } catch (e) {
      emit(WeatherErrorState(e.toString()));
    }
  }
}
