import 'package:dio/dio.dart';
import '../models/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = '5f0a4962ac1d44f4811150942241104';
  WeatherService(this.dio);
  Future<WeatherModel> getCurrent({required String cityName}) async {
    try {
      var response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ??
          'oops there was an error, try later';
      throw Exception(errorMessage);
    }catch(e){
      throw Exception('oops there was an error, try later');
    }
  }
}