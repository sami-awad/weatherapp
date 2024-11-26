import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/weathercubit/weather_cubit.dart';
import 'package:weatherapp/weathercubit/weather_cubit.dart';
import 'package:weatherapp/weidgets/weathersucces.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        final cubit = context.read<WeatherCubit>();
        return Scaffold(
          body: Center(
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.red,Colors.blue],
                      begin: Alignment.topRight,
                      end: Alignment.bottomCenter,
                    )
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                      onSubmitted: (value) {
                        cubit.fetchdata(city: value);
                        print(cubit.weatherModel.location);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BlocProvider.value(
                              value: cubit, // تمرير الـ Cubit الحالي
                              child: Weathersucces(),
                            ),
                          ),
                        );},
                      decoration: InputDecoration(
                        label: const Text('Search a city',style: TextStyle(color: Colors.white),),
                        suffixIcon: Icon(CupertinoIcons.search,color: Colors.white,),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white, width: 2),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(width: 2, color: Colors.white),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                      SizedBox(height: 50,),
                      Text('OOPS there is no data search acity now !',style: TextStyle(
                        fontSize: 25,
                        color: Colors.white

                      ))
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
