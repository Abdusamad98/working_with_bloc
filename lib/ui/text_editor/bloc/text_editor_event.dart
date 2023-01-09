part of 'text_editor_bloc.dart';

@immutable
abstract class TextEditorEvent {}

class GetUpperCaseText extends TextEditorEvent {
  GetUpperCaseText({required this.text});

  final String text;
}

class GetTextLength extends TextEditorEvent{
  GetTextLength({required this.text});

  final String text;
}

class GetTextRuntimeType extends TextEditorEvent{
  GetTextRuntimeType({required this.text});

  final String text;
}
