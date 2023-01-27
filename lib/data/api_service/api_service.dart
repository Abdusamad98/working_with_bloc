import 'package:dio/dio.dart';
import 'package:working_with_bloc/data/models/album_model.dart';
import 'package:working_with_bloc/data/models/banking/banking_model.dart';
import 'package:working_with_bloc/data/models/my_response/my_response.dart';
import 'package:working_with_bloc/data/models/user_model/user_model.dart';

import 'api_client.dart';

class ApiService extends ApiClient {



  Future<MyResponse> getAllUsers() async {
    MyResponse myResponse = MyResponse(error: "");
    try {
      Response response = await dio.get(dio.options.baseUrl);
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        myResponse.data =
            (response.data as List).map((e) => UserModel.fromJson(e)).toList();
      }
    } catch (error) {
      myResponse.error = error.toString();
    }
    return myResponse;
  }



  Future<MyResponse> getAllCards() async {
    MyResponse myResponse = MyResponse(error: "");
    try {
      Response response = await dio.get(dio.options.baseUrl);
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        myResponse.data =
            (response.data as List).map((e) => CardModel.fromJson(e)).toList();
      }
    } catch (error) {
      myResponse.error = error.toString();
    }
    return myResponse;
  }


  Future<MyResponse> getSingleAlbumById(int id) async {
    // Dio dio = Dio();
    MyResponse myResponse = MyResponse(error: "");
    try {
      Response response = await dio.get("${dio.options.baseUrl}/albums/$id");
      if (response.statusCode == 200) {
        myResponse.data = Album.fromJson(response.data);
      }
    } catch (err) {
      myResponse.error = err.toString();
      //print(err.toString());
    }

    return myResponse;
  }

  Future<MyResponse> getAllAlbums() async {
    // Dio dio = Dio();
    MyResponse myResponse = MyResponse(error: "");
    try {
      Response response = await dio.get("${dio.options.baseUrl}/albums");
      if (response.statusCode == 200) {
        myResponse.data =
            (response.data as List?)?.map((e) => Album.fromJson(e)).toList() ??
                [];
      }
    } catch (err) {
      myResponse.error = err.toString();
    }
    return myResponse;
  }
}
