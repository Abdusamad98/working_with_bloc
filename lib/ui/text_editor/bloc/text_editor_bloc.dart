import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'text_editor_event.dart';

part 'text_editor_state.dart';

class TextEditorBloc extends Bloc<TextEditorEvent, TextEditorState> {
  TextEditorBloc() : super(TextEditorInitial()) {
    on<GetUpperCaseText>(_getUpperCaseLogic);

    on<GetTextLength>((event, emit) {
      emit(TextLengthState(textLength: event.text.length));
    });

    on<GetTextRuntimeType>(
      (event, emit) {
        emit(ShowTypeState(textType: event.text.runtimeType));
      },
    );
  }

  _getUpperCaseLogic(GetUpperCaseText event, Emitter<TextEditorState> emit) {
    var t = event.text.toUpperCase();
    emit(UpperCaseState(resultText: t));
  }
}
