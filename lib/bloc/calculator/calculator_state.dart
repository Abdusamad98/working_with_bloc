abstract class CalculatorState {}

class InitialState extends CalculatorState {

}

class AdditionState extends CalculatorState {
  AdditionState(this.additionResult);

  num additionResult = 0;
}

class SubtructionState extends CalculatorState {
  SubtructionState(this.subtructionResult);

  num subtructionResult = 0;
}

class MultiplactionState extends CalculatorState {
  MultiplactionState(this.multiplactionResult);

  num multiplactionResult = 0;
}

class DivisionState extends CalculatorState {
  DivisionState(this.divisionResult);

  num divisionResult = 0;
}
