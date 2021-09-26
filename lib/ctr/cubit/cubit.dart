import 'package:flutter_bloc/flutter_bloc.dart';
import 'states.dart';

class CounterCubit extends Cubit<CounterStates> {
  CounterCubit() : super(CounterInitialState());
  int counter = 0;
  bool isMinusActivated = false;
  static CounterCubit get(context) => BlocProvider.of(context);
  void minus() {
    counter--;
    if (counter == 0) isMinusActivated = false;

    emit(CounterDecrementState());
  }

  void plus() {
    counter++;
    if (counter != 0) isMinusActivated = true;
    emit(CounterIncrementState());
  }
}
