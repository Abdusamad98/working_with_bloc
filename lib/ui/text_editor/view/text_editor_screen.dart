import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:working_with_bloc/ui/text_editor/bloc/text_editor_bloc.dart';

class TextEditorScreen extends StatelessWidget {
  const TextEditorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text Editor"),
      ),
      body: BlocProvider<TextEditorBloc>(
        create: (context) => TextEditorBloc(),
        child:Column(
          children: [
            BlocBuilder<TextEditorBloc,TextEditorState>(
              builder: (context, state){
                return  TextField(
                  onChanged: (value) {
                    BlocProvider.of<TextEditorBloc>(context).add(
                      GetTextRuntimeType(text: value),
                    );
                  },
                );
              },
            ),

            BlocBuilder<TextEditorBloc, TextEditorState>(
              builder: (context, state) {
                if (state is UpperCaseState) {
                  return Center(
                    child: Text(
                      state.resultText,
                    ),
                  );
                } else if (state is TextLengthState) {
                  return Center(
                    child: Text(
                      state.textLength.toString(),
                    ),
                  );
                } else if (state is ShowTypeState) {
                  return Center(
                    child: Text(
                      state.textType.toString(),
                    ),
                  );
                }
                return const SizedBox();
              },
            ),
          ],
        )

      ),
    );
  }
}
