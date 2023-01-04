
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/weatherModel.dart';
import 'package:weather_app/weather_cubit/states.dart';
import 'package:http/http.dart' as http;


class WeatherCubit extends Cubit<WeatherStates>{

    WeatherCubit():super(WeatherInitial());

    static WeatherCubit get(context)=> BlocProvider.of(context);

    WeatherModel? weatherModel;

    Future<WeatherModel?> service({required String city}) async {
        Uri url = Uri.parse(
            'http://api.weatherapi.com/v1/current.json?key=36b7bef6d7a0468ab5930929230401&q=$city&aqi=no',
        );
        emit(WeatherLoading());
        http.Response response = await http.get(url);
        if (response.statusCode == 200) {
        Map<String, dynamic> data =jsonDecode(response.body) ;
        weatherModel = WeatherModel.fromJson(data);
        emit(WeatherSuccess());
        return weatherModel;
        }else{
            emit(WeatherFailed());
        }

    }
}