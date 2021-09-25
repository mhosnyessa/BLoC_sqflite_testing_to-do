import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'count_event.dart';
part 'count_state.dart';

class CountBloc extends Bloc<CountEvent, CountState> {
  CountBloc() : super(CountState(counter: 1));

  @override
  Stream<CountState> mapEventToState(
    CountEvent event,
  ) async* {
    if (event is IncrementEvent) {
      yield CountState(counter: state.counter! + 1);
    } else if (event is DecrementEvent) {
      yield CountState(counter: state.counter! - 1);
    }
  }
}
