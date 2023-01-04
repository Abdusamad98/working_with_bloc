import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:working_with_bloc/bloc/calculator/calculator_state.dart';

class CalculatorCubit extends Cubit<CalculatorState> {
  CalculatorCubit() : super(InitialState(a: 10, b: 15));

  add(int a, int b) {
    emit(AdditionState(a + b));
  }

  sub(int a, int b) {
    SubtructionState subtructionState = SubtructionState(a - b);
    emit(subtructionState);
  }

  multiple(int a, int b) {
    emit(MultiplactionState(a * b));
  }

  division(int a, int b) {
    emit(DivisionState(a ~/ b));
  }
}
