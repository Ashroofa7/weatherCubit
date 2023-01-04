import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers.dart';
import 'package:weather_app/weatherModel.dart';
import 'package:weather_app/weatherScreen.dart';
import 'package:weather_app/weather_cubit/cubit.dart';
import 'package:weather_app/weather_cubit/states.dart';

void main() {
  runApp(
      const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit(),
      child: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherStates>(
      builder: (context, state) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
              primarySwatch: WeatherCubit.get(context)
                      .weatherModel
                      ?.current
                      ?.condition
                      ?.Getimage() ??
                  Colors.orange,
              ),
          debugShowCheckedModeBanner: false,
          home: WeatherScreen(),
        );
      },
    );
  }
}
