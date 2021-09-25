part of 'count_bloc.dart';

abstract class CountEvent extends Equatable {
  const CountEvent();
}

class IncrementEvent extends CountEvent {
  @override
  List<Object?> get props => [];
}

class DecrementEvent extends CountEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
