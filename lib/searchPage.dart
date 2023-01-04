import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:weather_app/providers.dart';
import 'package:weather_app/weatherModel.dart';
import 'package:weather_app/weather_cubit/cubit.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: TextField(
                decoration: const InputDecoration(
                    label: Text('Search'),
                    suffixIcon: Icon(Icons.search),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 32),
                    border: OutlineInputBorder(),
                    hintText: 'Enter a City'),
                onSubmitted: (v) async {

                  await WeatherCubit.get(context).service(city: v,);
                  // ignore: use_build_context_synchronously
                 // Provider.of<WeatherProvider>(context,listen: false).weatherModel=model;
                 //  print(model!.current!.tempC);
                  // ignore: use_build_context_synchronously
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

}
