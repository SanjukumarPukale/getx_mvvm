import 'package:getx_mvvm/res/components/round_button.dart';
import 'package:getx_mvvm/res/routes/app_exports.dart';
import 'package:getx_mvvm/view_model/controller/login/login_view_model.dart';

class LoginButtonWidget extends StatelessWidget {
  final formKey;
  LoginButtonWidget({ Key? key, required this.formKey }) : super(key: key);

  final loginVM = Get.put(LoginViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() =>  RoundButton(
                loading: loginVM.loading.value,
                width: 200,
                title: 'Login', 
                onPress: () {
                  if(formKey.currentState!.validate()) {
                    loginVM.loginApi();
                  }
                }),);
  }
}