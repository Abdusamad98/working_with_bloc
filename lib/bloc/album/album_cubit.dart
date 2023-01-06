import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:working_with_bloc/bloc/album/album_event.dart';
import 'package:working_with_bloc/bloc/album/album_state.dart';
import 'package:working_with_bloc/data/models/my_response/my_response.dart';
import 'package:working_with_bloc/data/repositories/album_repo.dart';

class AlbumCubit extends Bloc<AlbumEvent, AlbumState> {
  AlbumCubit(this.albumRepos) : super(InitialAlbumState()) {
    on<FetchAllAlbums>(_fetchAllAlbums);
    on<FetchSingleAlbum>(_fetchSingleAlbum);
  }

  final AlbumRepos albumRepos;

  _fetchAllAlbums(FetchAllAlbums event, Emitter<AlbumState> emit) async {
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

  _fetchSingleAlbum(FetchSingleAlbum event, Emitter<AlbumState> emit) async {
    //loading
    emit(LoadAlbumInProgress());
    MyResponse myResponse = await albumRepos.getSingleAlbumById(event.id);
    if (myResponse.error.isEmpty) {
      //success
      emit(LoadAlbumInSuccess(album: myResponse.data));
    } else {
      //error
      emit(LoadAlbumInFailure(errorText: myResponse.error));
    }
  }
}
