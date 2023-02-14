import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:working_with_bloc/data/models/banking/banking_model.dart';
import 'package:working_with_bloc/data/models/my_response/my_response.dart';
import 'package:working_with_bloc/data/models/status/data_status.dart';
import 'package:working_with_bloc/data/repositories/banking_repository.dart';

part 'cards_event.dart';

part 'cards_state.dart';

class CardsBloc extends Bloc<CardsEvent, CardsState> {
  CardsBloc({required this.bankingRepository})
      : super(
          const CardsState(
            status: DataStatus.PURE,
            statusText: "",
            cards: [],
          ),
        ) {
    on<GetCards>((GetCards event, Emitter<CardsState> emit) async {
      emit(state.copyWith(
        status: DataStatus.LOADING,
        statusText: "",
      ));
      MyResponse myResponse = await bankingRepository.getAllCards();
      if (myResponse.error.isNotEmpty) {
        emit(state.copyWith(
          status: DataStatus.ERROR,
          statusText: myResponse.error,
        ));
      } else {
        emit(
          state.copyWith(
              status: DataStatus.SUCCESS,
              statusText: "success",
              cards: myResponse.data as List<CardModel>),
        );
      }
    });
  }

  bool isLoading = false;

  late Stream<String> myNameStream;

  final BankingRepository bankingRepository;
}
