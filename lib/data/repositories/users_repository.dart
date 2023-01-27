import 'package:working_with_bloc/data/api_service/api_service.dart';
import 'package:working_with_bloc/data/local/local_databes.dart';
import 'package:working_with_bloc/data/models/my_response/my_response.dart';
import 'package:working_with_bloc/data/models/user_model/user_model.dart';

class UsersRepository {

  UsersRepository({required this.apiService});

  final ApiService apiService;

  Future<MyResponse> getAllUsers() => apiService.getAllUsers();

  Future<UserModel> insertUserToDb(UserModel userModel) =>
      LocalDatabase.insertUser(userModel: userModel);

  Future<List<UserModel>> getAllCachedUsers() => LocalDatabase.getCachedUsers();

  Future<int> deleteCachedUsers() => LocalDatabase.deleteAll();
}
