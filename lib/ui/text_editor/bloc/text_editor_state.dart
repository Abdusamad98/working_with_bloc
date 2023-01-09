part of 'text_editor_bloc.dart';

@immutable
abstract class TextEditorState {}

class TextEditorInitial extends TextEditorState {}

class UpperCaseState extends TextEditorState {
  UpperCaseState({required this.resultText});

  final String resultText;
}

class TextLengthState extends TextEditorState {
  TextLengthState({required this.textLength});

  final int textLength;
}

class ShowTypeState extends TextEditorState {
  ShowTypeState({required this.textType});

  final Type textType;
}
