part of 'forcast_bloc.dart';

sealed class ForcastEvent extends Equatable {
  const ForcastEvent();

  @override
  List<Object> get props => [];
}

class ForcastFetchEvent extends ForcastEvent {
  final Position position;

  const ForcastFetchEvent({required this.position});

    @override
  List<Object> get props => [position];

  
}
