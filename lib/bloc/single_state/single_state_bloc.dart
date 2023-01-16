import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'single_state_event.dart';

part 'single_state_state.dart';

class SingleStateBloc extends Bloc<SingleStateEvent, SingleState> {
  SingleStateBloc()
      : super(
          const SingleState(
            number: 0,
            errorText: "error bosh",
            successText: "success bosh",
            isLoading: false,
          ),
        ) {
    on<SetNumber>(
        (event, emit) => {emit(state.copyWith(number: event.number))});

    on<SetErrorText>(
        (event, emit) => {emit(state.copyWith(errorText: event.errorText,number: 100))});

    on<SuccessEvent>((event, emit) =>
        {emit(state.copyWith(successText: event.successText))});
  }
}
