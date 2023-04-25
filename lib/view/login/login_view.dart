import 'package:getx_mvvm/res/components/round_button.dart';
import 'package:getx_mvvm/res/routes/app_exports.dart';
import 'package:getx_mvvm/view_model/controller/login/login_view_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({ Key? key }) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  final loginVM = Get.put(LoginViewModel());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(Languages.login.tr),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
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
              ),
              SizedBox(height: 40,),
               TextFormField(
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
              ),
              SizedBox(height: 40,),
             Obx(() =>  RoundButton(
                loading: loginVM.loading.value,
                width: 200,
                title: 'Login', 
                onPress: () {
                  if(_formKey.currentState!.validate()) {
                    loginVM.loginApi();
                  }
                }),)
            ],
          ),
        ),
      ),
    );
  }
}