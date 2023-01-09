import 'package:working_with_bloc/data/models/album_model.dart';

abstract class AlbumsState {}

class InitialAlbumState extends AlbumsState {}

// -------  Fetch All Albums States ------
class LoadAlbumsInProgress extends AlbumsState {}

class LoadAlbumsInSuccess extends AlbumsState {
  LoadAlbumsInSuccess({required this.albums});

  final List<Album> albums;
}

class LoadAlbumsInFailure extends AlbumsState {
  LoadAlbumsInFailure({required this.errorText});

  final String errorText;
}
