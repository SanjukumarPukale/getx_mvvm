import 'dart:async';

import 'package:getx_mvvm/res/routes/app_exports.dart';
import 'package:getx_mvvm/res/routes/routes.dart';
import 'package:getx_mvvm/res/routes/routes_name.dart';
import 'package:getx_mvvm/view_model/controller/user_preference/user_preference_view_model.dart';

class SplashServices {

  UserPreferences userPreferences = UserPreferences();

 void isLogin() {
 
  Timer(const Duration(seconds: 3), () {
     userPreferences.getUser().then((value) {
    print(value.token);
    if(value.token.toString() == 'null') {
      Get.toNamed(RouteName.loginView);
    } else {
      Get.toNamed(RouteName.homeView);
    }
  });
  },);
  }
}