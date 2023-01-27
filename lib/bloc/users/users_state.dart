part of 'users_bloc.dart';

@immutable
abstract class UsersState {}

class UsersInitial extends UsersState {}

class UsersLoadInProgress extends UsersState {}

class UsersLoadInSuccess extends UsersState {
  UsersLoadInSuccess({required this.users});

  final List<UserModel> users;
}

class UsersLoadInFailure extends UsersState {
  UsersLoadInFailure({required this.errorText});

  final String errorText;
}

class UsersFromCache extends UsersState {
  UsersFromCache({required this.users});

  final List<UserModel> users;
}
