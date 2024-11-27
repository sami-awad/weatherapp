import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/weathercubit/weather_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/weidgets/hourweather.dart';

class Weathersucces extends StatefulWidget {
  const Weathersucces({super.key});

  @override
  State<Weathersucces> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Weathersucces> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        final cubit = context.read<WeatherCubit>();
        if( state is WeatherLoading){
          return Scaffold(
            body: Center(
              child: SizedBox(
                height: 100,
                width: 100,
                child: CircularProgressIndicator(
                  backgroundColor: null,
                ),
              ),
            ),
          );
        }
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.blue, Colors.white],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 50),
              child: Column(
                children: [
                  Column(
                    children: [
                      const SizedBox(height: 75),

                      const SizedBox(height: 50),
                      Text(
                        cubit.weatherModel.location?.name ?? "Location not found",
                        style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Updated at: ${cubit.weatherModel.current?.lastUpdated?.substring(11, 16) ?? "N/A"}',
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 80,
                            width: 80,
                            child: Image.network(
                              'https:${cubit.weatherModel.current?.condition?.icon ?? ""}',fit: BoxFit.fill,
                              errorBuilder: (context, error, stackTrace) {
                                return Icon(Icons.error, size: 80);
                              },
                            ),
                          ),
                          Text(
                            '${cubit.weatherModel.current?.tempC ?? "N/A"} °C',
                            style: TextStyle(fontSize: 20),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Max Temp: ${cubit.weatherModel.forecast?.forecastday?[0].day?.maxtempC ?? "N/A"}',
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(
                                'Min Temp: ${cubit.weatherModel.forecast?.forecastday?[0].day?.mintemp_c ?? "N/A"}',
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Text(
                        '${cubit.weatherModel.current?.condition?.text ?? "No Condition"}',
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(height: 30),
                      weatherbyhour(),
                      SizedBox(height: 50,),
                      InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 70,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                                colors: [Colors.blue,Colors.red],
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight
                            )
                          ),
                        child: Center(
                          child: Text('Search another city',style: TextStyle(
                            color: Colors.white,
                            fontSize: 25
                          ),),
                        ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );}
    );
  }
}

