import 'package:working_with_bloc/data/models/album_model.dart';

abstract class AlbumState {}

class InitialAlbumState extends AlbumState {}

// -------  Fetch All Albums States ------
class LoadAlbumsInProgress extends AlbumState {}

class LoadAlbumsInSuccess extends AlbumState {
  LoadAlbumsInSuccess({required this.albums});

  final List<Album> albums;
}

class LoadAlbumsInFailure extends AlbumState {
  LoadAlbumsInFailure({required this.errorText});

  final String errorText;
}


// ------- Fetch Single Album States ------

class LoadAlbumInProgress extends AlbumState {}

class LoadAlbumInSuccess extends AlbumState {
  LoadAlbumInSuccess({required this.album});

  final Album album;
}

class LoadAlbumInFailure extends AlbumState {
  LoadAlbumInFailure({required this.errorText});

  final String errorText;
}
