part of 'forcast_bloc.dart';

sealed class ForcastState extends Equatable {
  const ForcastState();

  @override
  List<Object> get props => [];
}

class ForcastInitial extends ForcastState {}

class ForcastloadingState extends ForcastState {}

class ForcastFailureState extends ForcastState {}

class ForcastSuccessState extends ForcastState {
  final List<Weather> weather;

  const ForcastSuccessState({required this.weather});

  @override
  List<Object> get props => [weather];
}
