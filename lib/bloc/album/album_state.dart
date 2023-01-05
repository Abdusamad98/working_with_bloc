import 'package:working_with_bloc/data/models/album_model.dart';

abstract class AlbumState {}

class InitialAlbumState extends AlbumState {}

class LoadAlbumsInProgress extends AlbumState {}

class LoadAlbumsInSuccess extends AlbumState {
  LoadAlbumsInSuccess({required this.albums});

  final List<Album> albums;
}

class LoadAlbumsInFailure extends AlbumState {
  LoadAlbumsInFailure({required this.errorText});

  final String errorText;
}




