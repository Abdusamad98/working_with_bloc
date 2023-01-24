import 'package:working_with_bloc/data/api_service/api_service.dart';
import 'package:working_with_bloc/data/models/my_response/my_response.dart';



class BankingRepository {
  BankingRepository({required this.apiService});

  final ApiService apiService;

  Future<MyResponse> getAllCards() => apiService.getAllCards();
}