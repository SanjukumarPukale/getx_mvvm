import 'package:getx_mvvm/res/routes/app_exports.dart';
import 'package:getx_mvvm/view_model/controller/login/login_view_model.dart';

class InputPasswordWidget extends StatelessWidget {
  InputPasswordWidget({ Key? key }) : super(key: key);

  final loginVM = Get.put(LoginViewModel());

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
                controller: loginVM.passwordController.value,
                focusNode: loginVM.passwordFocusNode.value,
                obscureText: true,
                validator: (value) {
                  if(value!.isEmpty) {
                    Utils.SnackBar('Password', 'Enter Password');
                  }
                },
                onFieldSubmitted: (value) {
                
                },
                decoration: InputDecoration(
                  hintText: Languages.passwordHint.tr,  
                  border: OutlineInputBorder()
                ),
              );
  }
}