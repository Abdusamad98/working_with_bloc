abstract class AlbumEvent {}

class FetchAllAlbums extends AlbumEvent {}

class FetchSingleAlbum extends AlbumEvent {
  FetchSingleAlbum({required this.id});

  final int id;
}
