import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/weathercubit/weather_cubit.dart';
import 'package:weatherapp/weidgets/nodata.dart';
import 'package:weatherapp/weidgets/weathersucces.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => WeatherCubit(),
        child: HomeScreen(),
      ),
    );
  }
}
