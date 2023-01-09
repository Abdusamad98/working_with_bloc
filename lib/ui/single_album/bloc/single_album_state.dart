import 'package:working_with_bloc/data/models/album_model.dart';

abstract class SingleAlbumState {}

class InitialSingleAlbumState extends SingleAlbumState {}

// ------- Fetch Single Album States ------

class LoadAlbumInProgress extends SingleAlbumState {}

class LoadAlbumInSuccess extends SingleAlbumState {
  LoadAlbumInSuccess({required this.album});

  final Album album;
}

class LoadAlbumInFailure extends SingleAlbumState {
  LoadAlbumInFailure({required this.errorText});

  final String errorText;
}
