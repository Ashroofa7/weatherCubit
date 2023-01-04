import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers.dart';
import 'package:weather_app/searchPage.dart';
import 'package:weather_app/weatherModel.dart';
import 'package:weather_app/weather_cubit/cubit.dart';
import 'package:weather_app/weather_cubit/states.dart';

class WeatherScreen extends StatelessWidget {
  WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherStates>(
      builder: (context, state) {
        WeatherModel? model = WeatherCubit.get(context).weatherModel;
        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const SearchPage();
                  }));
                },
                icon: const Icon(Icons.search),
              ),
            ],
          ),
          body: (state is WeatherSuccess)
              ? Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        model!.current!.condition!.Getimage(),
                        model.current!.condition!.Getimage()[50]!,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Column(
                    children: [
                      const Spacer(),
                      Text(
                        ' ${model.location!.name}',
                        style: const TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Updated at ${model.current!.lastUpdated!.hour}:${model.current!.lastUpdated!.minute}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                              child: Image(
                            image: NetworkImage(
                                'http:${model.current!.condition!.icon}'),
                          )),
                          Expanded(
                              child: Text(
                                  'temp = ${model.current!.tempC!.toInt()}')),
                          Expanded(
                            child: Column(
                              children: [
                                Text('temp = ${model.current!.tempC}'),
                                Text('temp = ${model.current!.tempC}'),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Text('temp = ${model.current!.condition!.text}'),
                      const Spacer(
                        flex: 3,
                      )
                    ],
                  ),
                )
              : Container(
                  child: (state is WeatherFailed)
                      ? const Center(child:  Text(' Something went Wrong'))
                      : const Center(child:  Text('Nothing to show')),
                ),
        );
      },
    );
  }
}
