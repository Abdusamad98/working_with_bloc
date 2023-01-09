import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:working_with_bloc/data/models/my_response/my_response.dart';
import 'package:working_with_bloc/data/repositories/album_repo.dart';
import 'package:working_with_bloc/ui/albums/bloc/album_event.dart';
import 'package:working_with_bloc/ui/albums/bloc/album_state.dart';

class AlbumsBloc extends Bloc<AlbumsEvent, AlbumsState> {
  AlbumsBloc(this.albumRepos) : super(InitialAlbumState()) {
    on<FetchAllAlbums>(_fetchAllAlbums);
  }

  final AlbumRepos albumRepos;

  _fetchAllAlbums(FetchAllAlbums event, Emitter<AlbumsState> emit) async {
    //loading
    emit(LoadAlbumsInProgress());
    MyResponse myResponse = await albumRepos.getAllAlbums();
    if (myResponse.error.isEmpty) {
      //success
      emit(LoadAlbumsInSuccess(albums: myResponse.data));
    } else {
      //error
      emit(LoadAlbumsInFailure(errorText: myResponse.error));
    }
  }

}
