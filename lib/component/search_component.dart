
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/get_current_cubit/get_current_cubit.dart';

class SearchComponent extends StatelessWidget {
  const SearchComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: TextField(
            onSubmitted: (value) async {
              var weather_model = BlocProvider.of<GetCurrentCubit>(context);
              weather_model.getCurrentWeather(cityName: value);
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              suffixIcon: const Icon(Icons.search),
              suffixIconColor: Colors.black,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              labelText: 'Search',
              hintText: 'Enter City Name',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.green)),
            ),
          ),
        ),
      ),
    );
  }
}
