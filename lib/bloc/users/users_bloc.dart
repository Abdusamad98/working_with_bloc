import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:working_with_bloc/data/models/my_response/my_response.dart';
import 'package:working_with_bloc/data/models/user_model/user_model.dart';
import 'package:working_with_bloc/data/repositories/users_repository.dart';

part 'users_event.dart';

part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersBloc(this.usersRepository) : super(UsersInitial()) {
    on<GetUsers>(_fetchUsers);
  }

  final UsersRepository usersRepository;

  _fetchUsers(GetUsers event, Emitter<UsersState> emit) async {
    emit(UsersLoadInProgress());

    MyResponse myResponse = await usersRepository.getAllUsers();

    if (myResponse.error.isEmpty) {
      List<UserModel> users = myResponse.data as List<UserModel>;
      emit(UsersLoadInSuccess(users: users));
      await _updateCachedUsers(users);
    } else {
      print("ERROR USERS: ${myResponse.error}");
      List<UserModel> users = await usersRepository.getAllCachedUsers();
      if (users.isNotEmpty) {
        emit(UsersFromCache(users: users));
      } else {
        emit(UsersLoadInFailure(errorText: myResponse.error));
      }
    }
  }

  _updateCachedUsers(List<UserModel> users) async {
    int deletedCount = await usersRepository.deleteCachedUsers();
    print("O'CHIRILGANLAR SONI:$deletedCount");
    for (var user in users) {
      await usersRepository.insertUserToDb(user);
    }
  }
}
