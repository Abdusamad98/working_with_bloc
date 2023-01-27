import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:working_with_bloc/bloc/users/users_bloc.dart';
import 'package:working_with_bloc/data/api_service/api_service.dart';
import 'package:working_with_bloc/data/repositories/users_repository.dart';
import 'package:cached_network_image/cached_network_image.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UsersBloc(
        UsersRepository(
          apiService: RepositoryProvider.of<ApiService>(context),
        ),
      )..add(GetUsers()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Cards"),
        ),
        body: BlocConsumer<UsersBloc, UsersState>(
          builder: (context, state) {
            if (state is UsersLoadInProgress) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is UsersLoadInFailure) {
              return Center(
                child: Text(state.errorText),
              );
            } else if (state is UsersLoadInSuccess) {
              return ListView(
                children: List.generate(state.users.length, (index) {
                  var item = state.users[index];
                  return ListTile(
                    title: Text(
                      item.username,
                    ),
                    trailing: CachedNetworkImage(
                      imageUrl: item.avatarUrl,
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                    ),
                  );
                }),
              );
            } else if (state is UsersFromCache) {
              return ListView(
                children: List.generate(state.users.length, (index) {
                  var item = state.users[index];
                  return ListTile(
                    title: Text(
                      item.username,
                    ),
                    trailing: CachedNetworkImage(
                      imageUrl: item.avatarUrl,
                      placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                    ),
                  );
                }),
              );
            }
            return const SizedBox();
          },
          listener: (context, state) {},
        ),
      ),
    );
  }
}
