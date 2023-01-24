import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:working_with_bloc/bloc/cards/cards_bloc.dart';
import 'package:working_with_bloc/data/api_service/api_service.dart';
import 'package:working_with_bloc/data/models/status/data_status.dart';
import 'package:working_with_bloc/data/repositories/banking_repository.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CardsBloc(
        bankingRepository: BankingRepository(
          apiService: RepositoryProvider.of<ApiService>(context),
        ),
      )..add(GetCards()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Cards"),
        ),
        body: BlocConsumer<CardsBloc, CardsState>(
          builder: (context, state) {
            if (state.status == DataStatus.LOADING) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state.status == DataStatus.ERROR) {
              return Center(
                child: Column(
                  children: [
                    Text(state.statusText),
                    ElevatedButton(
                        onPressed: () {
                          context.read<CardsBloc>().add(GetCards());
                        },
                        child: const Text("Refresh"))
                  ],
                ),
              );
            } else {
              return ListView(
                children: List.generate(
                  state.cards.length,
                  (index) => ListTile(
                    title: Text(
                      state.cards[index].bankName,
                    ),
                  ),
                ),
              );
            }
          },
          listener: (context, state) {},
        ),
      ),
    );
  }
}
