import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:working_with_bloc/bloc/counter/counter_cubit.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key, required this.counterCubit}) : super(key: key);

  final CounterCubit counterCubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: counterCubit,
      child: BlocBuilder<CounterCubit, int>(builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Counter Page"),
            actions: [
              FloatingActionButton(
                onPressed: () {
                  // BlocProvider.of<CounterCubit>(context).decrement();
                  context.read<CounterCubit>().decrement();
                },
                child: Icon(Icons.remove),
              ),
            ],
          ),
          body: Center(
            child: Text(
              state.toString(),
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              BlocProvider.of<CounterCubit>(context).increment();
            },
            child: Icon(Icons.add),
          ),
        );
      }),
    );
  }
}
