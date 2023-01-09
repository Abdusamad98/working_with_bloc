abstract class SingleAlbumEvent {}


class FetchSingleAlbum extends SingleAlbumEvent {
  FetchSingleAlbum({required this.id});

  final int id;
}
