class WeatherModel {
  final String cityname;
  final String date;
  final String? image;
  final double temp;
  final double maxtemp;
  final double mintemp;
  final String weathercondition;

  WeatherModel(
      {required this.cityname,
      required this.date,
      required this.image,
      required this.maxtemp,
      required this.mintemp,
      required this.temp,
      required this.weathercondition});

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      cityname: json['location']['name'],
      date: json['location']['localtime'],
      image: json['current']['condition']['icon'],
      temp: (json['current']['temp_c']).toDouble(),
      maxtemp:
          (json['forecast']['forecastday'][0]['day']['maxtemp_c']).toDouble(),
      mintemp:
          (json['forecast']['forecastday'][0]['day']['mintemp_c']).toDouble(),
      weathercondition: json['current']['condition']['text'],
    );
  }
}
