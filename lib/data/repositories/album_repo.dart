import 'package:working_with_bloc/data/api_service/api_service.dart';
import 'package:working_with_bloc/data/models/my_response/my_response.dart';

class AlbumRepos {
  AlbumRepos({required this.apiService});

  final ApiService apiService;

  Future<MyResponse> getSingleAlbumById(int id) =>
      apiService.getSingleAlbumById(id);

  Future<MyResponse> getAllAlbums() => apiService.getAllAlbums();
}
