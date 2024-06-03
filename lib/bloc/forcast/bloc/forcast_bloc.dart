
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';

part 'forcast_event.dart';
part 'forcast_state.dart';

class ForcastBloc extends Bloc<ForcastEvent, ForcastState> {
  ForcastBloc() : super(ForcastInitial()) {
    on<ForcastFetchEvent>(
      (event, emit) async {
        emit(ForcastloadingState());
        try {
        WeatherFactory wf = WeatherFactory("a0c93db887733470ad055501d60a221d",
            language: Language.ENGLISH);

        List<Weather> weather = await wf.fiveDayForecastByLocation(
            event.position.latitude, event.position.longitude);
            
        emit(ForcastSuccessState(weather: weather));
      } catch (e) {
        emit(ForcastFailureState());
      }
      },
    );
  }
}
