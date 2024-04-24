
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swe_weather_app/screens/search_weather.dart';

import '../component/no_weather.dart';
import '../component/weather_component.dart';
import '../cubit/get_current_cubit/get_current_cubit.dart';
import '../cubit/get_current_cubit/get_current_state.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: const Text(
          'Weather App',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const SearchWeather();
              }));
            },
            icon: const Icon(
              Icons.search,
              size: 28,
            ),
          )
        ],
      ),
      body:
          BlocBuilder<GetCurrentCubit, WeatherState>(builder: (context, state) {
        if (state is NoWeatherState) {
          return const NoWeather();
        } else if (state is WeatherLoadedState) {
          return WeatherComponent();
        } else {
          return const Center(
              child: Text(
            'oops there was an error,try later',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ));
        }
      }),
    );
  }
}