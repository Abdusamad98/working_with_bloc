part of 'single_state_bloc.dart';

abstract class SingleStateEvent {
  const SingleStateEvent();
}

class SetNumber  extends SingleStateEvent{
  SetNumber({required this.number});

  final int number;
}

class SetErrorText extends SingleStateEvent{
  SetErrorText({required this.errorText});

  final String errorText;
}



class SuccessEvent extends SingleStateEvent{
  SuccessEvent({required this.successText});

  final String successText;
}
