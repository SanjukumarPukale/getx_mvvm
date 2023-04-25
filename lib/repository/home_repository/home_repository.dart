import 'package:getx_mvvm/data/network/network_api_service.dart';
import 'package:getx_mvvm/models/home/user_list.dart';
import 'package:getx_mvvm/res/app_url/app_url.dart';

class HomeRepository {
  final _apiService = NetworkApiService();

  Future<UserListModel> userListApi() async {
    dynamic response = await _apiService.getApi(AppUrl.userListUrl);
    return UserListModel.fromJson(response);
  }
}