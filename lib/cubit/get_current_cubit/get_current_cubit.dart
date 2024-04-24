
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/weather_model.dart';
import '../../services/weather_service.dart';
import 'get_current_state.dart';

class GetCurrentCubit extends Cubit<WeatherState> {
  //GetCurrentCubit(super.NoWeatherState);
  GetCurrentCubit(): super(NoWeatherState());
   WeatherModel? weatherModel;
  getCurrentWeather({required String cityName}) async {
    try {
       weatherModel =
          await WeatherService(Dio()).getCurrent(cityName: cityName);
      emit(WeatherLoadedState());
    } catch (e) {
      emit(FailureWeatherState());
    }
  }
}