/*
import 'package:advanced_weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:advanced_weather_app/main.dart';
import 'package:advanced_weather_app/models/weather_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key, required this.weather});
  final WeatherModel weather;

  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel = BlocProvider.of<GetWeatherCubit>(
      context,
    ).weatherModel!;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            getThemeColor(condition: weatherModel.weatherCondition),
            getThemeColor(condition: weatherModel.weatherCondition)[300]!,
            getThemeColor(condition: weatherModel.weatherCondition)[50]!,
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weatherModel.cityName,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
            ),
            Text(
              weatherModel.date.hour > 12
                  ? "Updated at ${weatherModel.date.hour - 12}:${weatherModel.date.minute} PM"
                  : "Updated at ${weatherModel.date.hour}:${weatherModel.date.minute} AM",
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                weatherModel.image!.contains("https:")
                    ? Image.network(weatherModel.image.toString())
                    : Image.network("https:${weatherModel.image}"),
                // ?? Image.asset("assets/images/cloudy.png"),
                Text(
                  "${weatherModel.temp.round().toString()} °C ",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      "Maxtemp: ${weatherModel.maxtemp.round()} °C",
                      style: const TextStyle(fontSize: 16),
                    ),
                    Text(
                      "Mintemp: ${weatherModel.mintemp.round()} °C",
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 32),
            Text(
              weatherModel.weatherCondition,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}
*/