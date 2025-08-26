import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherServies {
  final Dio dio = Dio();
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String key = '2f689759b5f04ca2a9e54229251708';
  Future<WeatherModel> getWeatherNews({required String city}) async {
    try {
      Response response = await dio.get(
          "http://api.weatherapi.com/v1/forecast.json?key=$key&q=$city&days=1");

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);

      return weatherModel;
    } on DioException catch (e) {
      throw Exception('Failed to fetch weather data: ${e.message}');
    } catch (e) {
      throw Exception('An unexpected error occurred: $e');
    }
  }
}
