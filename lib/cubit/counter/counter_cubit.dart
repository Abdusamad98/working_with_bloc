import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit(int initialState) : super(initialState);

  void increment() {
    print(state);
    emit(state + 1);
    print(state);
  }

  void decrement() {
    int newState = state - 1;
    emit(newState);
  }
}
