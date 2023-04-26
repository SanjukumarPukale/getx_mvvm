import 'package:getx_mvvm/models/login/user_model.dart';
import 'package:getx_mvvm/repository/login_repository/login_repository.dart';
import 'package:getx_mvvm/res/routes/app_exports.dart';
import 'package:getx_mvvm/res/routes/routes_name.dart';
import 'package:getx_mvvm/view_model/controller/user_preference/user_preference_view_model.dart';

class LoginViewModel extends GetxController {

  final _api = LoginRepository();
  UserPreferences userPreferences = UserPreferences();
  
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  RxBool loading = false.obs;

  void loginApi() {
    loading.value = true;
    Map data = {
      'email': emailController.value.text,
      'password': passwordController.value.text
    };
    _api.loginApi(data).then((value) {
      loading.value = false;
      if(value['error'] == 'user not found' || value['error'] == 'Missing email or username') {
        Utils.SnackBar('Login', value['error']);
      } else {
         userPreferences.saveUser(UserModel.fromJson(value)).then((value) {
         Get.delete<LoginViewModel>();    // delete LoginViewModel memory
         Get.toNamed(RouteName.homeView);
         }).onError((error, stackTrace) {

         });

         Utils.SnackBar('Login', 'Login Successful!');
      }
     
    }).onError((error, stackTrace) {
      loading.value = false;
      Utils.SnackBar('Error', error.toString());
    });
  }
}