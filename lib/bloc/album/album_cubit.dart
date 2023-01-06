import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:working_with_bloc/bloc/album/album_state.dart';
import 'package:working_with_bloc/data/models/my_response/my_response.dart';
import 'package:working_with_bloc/data/repositories/album_repo.dart';

class AlbumCubit extends Cubit<AlbumState> {
  AlbumCubit(this.albumRepos) : super(InitialAlbumState()) {
    // 1  fetchAllAlbums();
  }

  final AlbumRepos albumRepos;

  fetchAllAlbums() async {
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



  fetchSingleAlbum(int id) async {
      //loading
    emit(LoadAlbumInProgress());
    MyResponse myResponse = await albumRepos.getSingleAlbumById(id);
    if (myResponse.error.isEmpty) {
      //success
      emit(LoadAlbumInSuccess(album: myResponse.data));
    } else {
      //error
      emit(LoadAlbumInFailure(errorText: myResponse.error));
    }
  }
}
