import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weatherapp/models/weathermodel.dart';
import '../api_helper.dart';
part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());
  WeatherModel weatherModel= WeatherModel();
  
  Future fetchdata({
    required String city,
})async{
    try{
      emit(WeatherLoading());
      final response = await ApiHelper.instance.get(city);
     // print(response.toString());
      weatherModel=WeatherModel.fromJson(response.data);
      emit(WeatherSuccess());
    }catch(e){
      print(e);
    }
  }
}
