import 'package:getx_mvvm/data/network/network_api_service.dart';
import 'package:getx_mvvm/res/app_url/app_url.dart';

class LoginRepository {
  final _apiService = NetworkApiService();

  Future<dynamic> loginApi(var data) async {
    dynamic response = await _apiService.postApi(data, AppUrl.loginUrl);
    return response;
  }
}