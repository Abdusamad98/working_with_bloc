import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:working_with_bloc/bloc/album/album_cubit.dart';
import 'package:working_with_bloc/bloc/album/album_event.dart';
import 'package:working_with_bloc/bloc/album/album_state.dart';
import 'package:working_with_bloc/ui/albums/single_album_screen.dart';
import 'package:working_with_bloc/utils/my_utils.dart';

class AlbumsScreen extends StatelessWidget {
  const AlbumsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //2 BlocProvider.of<AlbumCubit>(context).fetchAllAlbums();
    return Scaffold(
        appBar: AppBar(
          title: const Text("All Albums"),
          actions: [
            IconButton(
                onPressed: () {
                  BlocProvider.of<AlbumCubit>(context).add(FetchAllAlbums());
                },
                icon: const Icon(Icons.upload))
          ],
        ),
        body: BlocConsumer<AlbumCubit, AlbumState>(
          builder: (context, state) {
            if (state is InitialAlbumState)
            {
              return const Center(
                child: Text("Hali data yo'q"),
              );
            } else if (state is LoadAlbumsInProgress) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is LoadAlbumsInSuccess) {
              return ListView(
                children: List.generate(
                  state.albums.length,
                  (index) => ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SingleAlbumScreen(
                            id: state.albums[index].id,
                          ),
                        ),
                      );
                    },
                    title: Text(
                      state.albums[index].title,
                    ),
                  ),
                ),
              );
            } else if (state is LoadAlbumsInFailure) {
              return Center(
                child: Text(
                  state.errorText,
                ),
              );
            }
            return const SizedBox();
          },
          buildWhen: (oldState, newState){
            return true;//newState is LoadAlbumsInFailure;
          },
          listener: (context, state) {
            print("TTTT");
            MyUtils.getMyToast(message: "Loading in progress...");
          },
          listenWhen: (oldState, newState){
            return oldState is LoadAlbumsInProgress;
          },
        ));
  }
}
