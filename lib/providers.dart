import 'package:flutter/material.dart';
import 'package:weather_app/weatherModel.dart';

class WeatherProvider extends ChangeNotifier{
  WeatherModel? _weatherModel;

  set weatherModel(WeatherModel? weatherData){
    _weatherModel= weatherData;
    notifyListeners();
  }
  WeatherModel? get weatherModel=> _weatherModel;


}