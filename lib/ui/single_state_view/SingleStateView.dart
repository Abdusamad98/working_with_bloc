import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:working_with_bloc/bloc/single_state/single_state_bloc.dart';

class SingleStateView extends StatelessWidget {
  const SingleStateView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SingleStateBloc, SingleState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "SUCCESS TEXT:${state.successText}",
                style: TextStyle(fontSize: 20, color: Colors.red),
              ),
              Text(
                "NUMBER TEXT:${state.number}",
                style: TextStyle(fontSize: 20, color: Colors.red),
              ),
              Text(
                "ERROR TEXT:${state.errorText}",
                style: TextStyle(fontSize: 20, color: Colors.red),
              ),
              ElevatedButton(
                  onPressed: () {
                    context.read<SingleStateBloc>().add(SetNumber(number: 12));
                  },
                  child: Text("Send Number")),

              ElevatedButton(
                  onPressed: () {
                    context.read<SingleStateBloc>().add(SetErrorText(errorText: 'ERROR'));
                  },
                  child: Text("Send Error")),

              ElevatedButton(
                  onPressed: () {
                    context.read<SingleStateBloc>().add(SuccessEvent(successText: 'Success'));
                  },
                  child: Text("Send Success")),
            ],
          );
        },
      ),
    );
  }
}
