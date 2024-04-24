
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/get_current_cubit/get_current_cubit.dart';
import '../main.dart';

class WeatherComponent extends StatelessWidget {
  const WeatherComponent({super.key});
  @override
  Widget build(BuildContext context) {
    var models = BlocProvider.of<GetCurrentCubit>(context).weatherModel!;
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        getThemeColor(models.weatherCondtion),
        getThemeColor(models.weatherCondtion)[300]!,
        getThemeColor(models.weatherCondtion)[50]!,
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(models.cityName,
              style:
                  const TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
          Text('updated at: ${models.date.hour}:${models.date.minute}',
              style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 50,
          ),
          Row(
            children: [
              const Spacer(
                flex: 1,
              ),
              Image.network(models.image.contains('https:')
                  ? models.image
                  : 'https:${models.image}'),
              const Spacer(
                flex: 1,
              ),
              Text(models.temp.round().toString(),
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold)),
              const Spacer(
                flex: 1,
              ),
              Column(
                children: [
                  Text('maxTemp: ${models.maxTemp.round()}',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold)),
                  Text('minTemp: ${models.minTemp.round()}',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold)),
                ],
              ),
              const Spacer(
                flex: 1,
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Text(models.weatherCondtion,
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold))
        ],
      ),
    );
  }
}
