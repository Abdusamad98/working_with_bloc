part of 'cards_bloc.dart';

class CardsState extends Equatable {
  final DataStatus status;
  final String statusText;
  final List<CardModel> cards;


const  CardsState({
    required this.status,
    required this.statusText,
    required this.cards,
  });

  CardsState copyWith({
    DataStatus? status,
    List<CardModel>? cards,
    String? statusText,
  }) =>
      CardsState(
        status: status ?? this.status,
        statusText: statusText ?? this.statusText,
        cards: cards ?? this.cards,
      );

  @override
  List<Object?> get props => [
        status,
        statusText,
        cards,
      ];
}
