import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:working_with_bloc/data/api_service/custom_exceptions.dart';
const String baseUrl= "https://fifth-exam.free.mockoapp.net/users";//"https://jsonplaceholder.typicode.com";
class ApiClient{

  ApiClient(){
    _init();
  }

   late Dio dio;

  _init(){
    dio = Dio(
      BaseOptions(
        connectTimeout: 25000,
        receiveTimeout: 20000,
        baseUrl: baseUrl,
      ),
    );

    dio.interceptors.add(InterceptorsWrapper(
      onError: (DioError error, ErrorInterceptorHandler handler){
        print("ON ERRORGA KIRDI:${error.toString()}");
        switch (error.type) {
          case DioErrorType.connectTimeout:
          case DioErrorType.sendTimeout:
          throw DeadlineExceededException(error.requestOptions);
          case DioErrorType.receiveTimeout:
          throw ReceiveTimeOutException(error.requestOptions);
          case DioErrorType.response:
            switch (error.response?.statusCode) {
              case 400:
                throw BadRequestException(error.response?.data['message']);
              case 401:
                throw UnauthorizedException(error.requestOptions);
              case 404:
                throw NotFoundException(error.requestOptions);
              case 409:
                throw ConflictException(error.requestOptions);
              case 500:
              case 501:
              case 503:
                throw InternalServerErrorException(error.requestOptions);
            }
            break;
          case DioErrorType.cancel:
            break;
          case DioErrorType.other:
            throw NoInternetConnectionException(error.requestOptions);
        }
        debugPrint('Error Status Code:${error.response?.statusCode}');
      return handler.next(error);
      },
      onRequest: (RequestOptions requestOptions,RequestInterceptorHandler handler){
        print("SO'ROV YUBORILDI");
        String currentLocale = "uz";
        requestOptions.headers["Accept"] = "application/json";
        requestOptions.headers["Accept-Language"] =
        currentLocale.isEmpty ? "ru" : currentLocale;
      return  handler.next(requestOptions);
      },
      onResponse: (Response response,ResponseInterceptorHandler handler ){
        print("URAAA RESPONSE KELDI");
      return handler.next(response);
      }
    ));
  }

}