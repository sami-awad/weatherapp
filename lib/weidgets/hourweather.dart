import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/weathercubit/weather_cubit.dart';

class weatherbyhour extends StatelessWidget {
  const weatherbyhour({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        final hourweather = context.read<WeatherCubit>();
        return SizedBox(
            height: 170,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: hourweather.weatherModel.forecast?.forecastday?[0].hour?.length,
                itemBuilder: (context, index) {
                  return _buildweatherbyhour(
                      hour: hourweather.weatherModel.forecast?.forecastday?[0].hour?[index].time?.substring(11,16)??'date',
                      temp:  hourweather.weatherModel.forecast?.forecastday?[0].hour?[index].tempC??'temp',
                      url:   hourweather.weatherModel.forecast?.forecastday?[0].hour?[index].condition?.icon);
                })
        );
      },
    );
  }

  Padding _buildweatherbyhour({
    required dynamic hour,
    required dynamic url,
    required dynamic temp,
}) {
    return Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Container(
                    height: 170, width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.blue.shade200,
                    ), child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Column(
                      children: [
                        Text('$hour',style: TextStyle(
                          fontSize: 18,
                        ),),
                        SizedBox(height: 10,),
                        Image.network('https:$url',errorBuilder: (context, error, stackTrace) {
                          return Icon(Icons.downloading, size: 30);
                        },),
                        SizedBox(height: 10,),
                        Text('$temp',style: TextStyle(fontSize: 20),)
                      ],
                                          ),
                    ),
                  ),
                );
  }
}
