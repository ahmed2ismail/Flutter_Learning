/*
import 'dart:developer';
import 'package:advanced_weather_app/models/weather_model.dart';
import 'package:dio/dio.dart';

class WeatherService {
  //*************** */ Bade code *************
  // It's better to not hardcode the base URL and API key.
  // Consider using environment variables for them.
  final String _baseUrl = "https://api.weatherapi.com/v1";
  final String _apiKey =
      "75b1132ba8b94bf3830134646251310"; // Move to environment variables
  //************** */ Bade code ************* 
  //################ Good code ############
  // Use environment variables to store sensitive information like API keys.
  final Dio dio;
  // final String _baseUrl = dotenv.env['BASE_URL']!; // environment variables;
  // final String _apiKey = dotenv.env['API_KEY']! ; // environment variables

  WeatherService(this.dio);

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try { 
      Response response = await dio.get(
        "$_baseUrl/forecast.json?key=$_apiKey&q=$cityName&days=1",
      );
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      أول ما يجيلي response.data (اللي هي ال JSON الكبيرة خالص) هبني ال WeatherModel باستخدام ال factory constructor اللي انا معرفه جوا ال WeatherModel
      أو بمعنى تاني هرجع ال WeatherModel اللي اتبنيلي بالبيانات اللي جتلي من ال API
      return weatherModel;
      ------------------------------------------------
      حل اخر باستخدام كتبة http.dart :
      {
        Uri url = Uri.parse("$_baseUrl/forecast.json?key=$_apiKey&q=$cityName&days=1");
        http.Response response = await http.get(url);
        if (response.statusCode == 400) {
          var data = jsonDecode(response.body);
          throw Exception(data['error']['message']);
        } 
        Map<String, dynamic> data = jsonDecode(response.body);
          WeatherModel weather = WeatherModel.fromJson(data);
          return weather;
        another way: ----------------
        final response = await http.get(Uri.parse(
            "$_baseUrl/forecast.json?key=$_apiKey&q=$cityName&days=1"));
        if (response.statusCode == 400) {
          final data = jsonDecode(response.body);
          throw Exception(data['error']['message']);
        }
        final data = jsonDecode(response.body);
        final weatherModel = WeatherModel.fromJson(data);
        return weatherModel;
        } else {
          throw Exception("Failed to load weather data");
        }
      }
        ------------------------------------------------
    } on DioException catch (e) {
      // Handle Dio-specific errors (e.g., network issues, timeouts, 4xx/5xx responses)
      final String errorMessage =
          e.response?.data['error']['message'] ??
          "Oops, there was an error. Please try again later.";
      throw Exception(errorMessage);
    } catch (e) {
      // Handle any other errors
      log دي معناها اني هسجل رسالة الخطأ في ال console عشان اقدر اعرف المشكلة فين
      log("ErrorMessage: ${e.toString()}");
      throw Exception("An unexpected error occurred. Please try again later.");
    }
  }
}
--------------------------------------------------------------------------------
class WeatherModel {
  final String cityName;
  final DateTime date;
  final String? image;
  final double temp;
  final double maxtemp;
  final double mintemp;
  final String weatherCondition;

  WeatherModel({
    required this.cityName,
    required this.date,
    this.image,
    required this.temp,
    required this.maxtemp,
    required this.mintemp,
    required this.weatherCondition,
  });
// نقدر نستخدم ال named constructor عشان انشا constructor بيبنيلي ال object ببيانات جاهزة جايالي من ال API ونقدر نستخدم factory عشان بتسمحلي اعمل return لل object ذات نفسه

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    // json هي عبارة عن Map<String, dynamic>  جايالي من ال API (الكبيرة خالص اللي فيها كل البيانات بتاعتي "response.body")
    return WeatherModel(
      cityName: json["location"]["name"], // جايبلي اسم المدينة
      date: DateTime.parse(json["current"]["last_updated"]), // جايبلي التاريخ والوقت
      image:
          json["forecast"]["forecastday"][0]["day"]["condition"]["icon"], // جايبلي الصورة
      temp:
          json["forecast"]["forecastday"][0]["day"]["avgtemp_c"], // جايبلي درجة الحرارة
      maxtemp:
          json["forecast"]["forecastday"][0]["day"]["maxtemp_c"], // جايبلي اعلى درجة حرارة
      mintemp:
          json["forecast"]["forecastday"][0]["day"]["mintemp_c"], // جايبلي اقل درجة حرارة
      weatherCondition:
          json["forecast"]["forecastday"][0]["day"]["condition"]["text"], // (جايبلي حالة الطقس (مشمس، غائم، ممطر...
    );
  }

*/
