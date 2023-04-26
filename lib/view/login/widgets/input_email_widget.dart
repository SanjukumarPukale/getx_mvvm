import 'package:getx_mvvm/res/routes/app_exports.dart';

import '../../../view_model/controller/login/login_view_model.dart';

class InputEmailWidget extends StatelessWidget {
  InputEmailWidget({ Key? key }) : super(key: key);

    final loginVM = Get.put(LoginViewModel());


  @override
  Widget build(BuildContext context) {
    return TextFormField(
                controller: loginVM.emailController.value,
                focusNode: loginVM.emailFocusNode.value,
                validator: (value) {
                  if(value!.isEmpty) {
                    Utils.SnackBar('Email', 'Enter email');
                  }
                },
                onFieldSubmitted: (value) {
                  Utils.fieldfocusChange(context, loginVM.emailFocusNode.value, loginVM.passwordFocusNode.value);
                },
                decoration: InputDecoration(
                  hintText: Languages.emailHint.tr,  
                  border: OutlineInputBorder()
                ),
              );
  }
}