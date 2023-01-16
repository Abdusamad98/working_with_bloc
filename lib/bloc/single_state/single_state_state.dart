part of 'single_state_bloc.dart';

class SingleState extends Equatable {
  const SingleState({
    required this.number,
    required this.errorText,
    required this.successText,
    required this.isLoading,
  });

  final String errorText;
  final String successText;
  final bool isLoading;
  final int number;

  SingleState copyWith({
    int? number,
    String? errorText,
    String? successText,
    bool? isLoading,
  }) =>
      SingleState(
        number: number ?? this.number,
        isLoading: isLoading ?? this.isLoading,
        errorText: errorText ?? this.errorText,
        successText: successText ?? this.successText,
      );

  @override
  List<Object> get props => [
        number,
        isLoading,
        successText,
        errorText,
      ];
}
