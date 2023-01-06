import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:working_with_bloc/bloc/album/album_cubit.dart';
import 'package:working_with_bloc/bloc/album/album_event.dart';
import 'package:working_with_bloc/bloc/album/album_state.dart';
import 'package:working_with_bloc/data/repositories/album_repo.dart';

class SingleAlbumScreen extends StatelessWidget {
  const SingleAlbumScreen({Key? key, required this.id}) : super(key: key);

  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AlbumCubit>(
      create: (context) =>
          AlbumCubit(context.read<AlbumRepos>())..add(FetchSingleAlbum(id: id)),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Deatiled Page"),
        ),
        body: BlocBuilder<AlbumCubit, AlbumState>(builder: (context, state) {
          // context.read<AlbumCubit>().fetchSingleAlbum(id);
          if (state is InitialAlbumState) {
            return const Center(
              child: Text("Hali data yo'q"),
            );
          } else if (state is LoadAlbumInProgress) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is LoadAlbumInSuccess) {
            return ListTile(
              title: Text(
                state.album.title,
              ),
            );
          } else if (state is LoadAlbumInFailure) {
            return Center(
              child: Text(
                state.errorText,
              ),
            );
          }
          return const SizedBox();
        }),
      ),
    );
  }
}
