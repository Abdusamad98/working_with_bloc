import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:working_with_bloc/cubit/calculator/calculator_cubit.dart';
import 'package:working_with_bloc/cubit/calculator/calculator_state.dart';

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Calculator page"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CalculatorCubit, CalculatorState>(
              builder: (context, state) {
                if (state is AdditionState) {
                  return Text(
                    "This is Addition:${state.additionResult}",
                    style: const TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                    ),
                  );
                } else if (state is SubtructionState) {
                  return Text(
                    "This is sub:${state.subtructionResult}",
                    style: const TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                    ),
                  );
                } else if (state is DivisionState) {
                  return Text(
                    "This is div:${state.divisionResult}",
                    style: const TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                    ),
                  );
                } else if (state is MultiplactionState) {
                  return Text(
                    "This is multi:${state.multiplactionResult}",
                    style: const TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                    ),
                  );
                }
                return const Text(
                  "Initial state",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                  ),
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      BlocProvider.of<CalculatorCubit>(context).add(12, 12);
                    },
                    icon: Icon(Icons.add)),
                IconButton(
                    onPressed: () {
                      BlocProvider.of<CalculatorCubit>(context).sub(12, 12);
                    },
                    icon: Icon(Icons.remove)),
                IconButton(
                    onPressed: () {
                      BlocProvider.of<CalculatorCubit>(context)
                          .multiple(12, 12);
                    },
                    icon: Icon(Icons.ac_unit)),
                IconButton(
                    onPressed: () {
                      BlocProvider.of<CalculatorCubit>(context)
                          .division(12, 12);
                    },
                    icon: Icon(Icons.dnd_forwardslash)),
              ],
            )
          ],
        ));
  }
}
