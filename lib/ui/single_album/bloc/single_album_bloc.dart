import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:working_with_bloc/data/models/my_response/my_response.dart';
import 'package:working_with_bloc/data/repositories/album_repo.dart';
import 'package:working_with_bloc/ui/albums/bloc/album_event.dart';
import 'package:working_with_bloc/ui/albums/bloc/album_state.dart';
import 'package:working_with_bloc/ui/single_album/bloc/single_album_event.dart';
import 'package:working_with_bloc/ui/single_album/bloc/single_album_state.dart';

class SingleAlbumBloc extends Bloc<SingleAlbumEvent, SingleAlbumState> {
  SingleAlbumBloc(this.albumRepos) : super(InitialSingleAlbumState()) {
    on<FetchSingleAlbum>(_fetchSingleAlbum);

  }

  final AlbumRepos albumRepos;

  _fetchSingleAlbum(FetchSingleAlbum event, Emitter<SingleAlbumState> emit) async {
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
