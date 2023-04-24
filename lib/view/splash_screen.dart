import 'package:getx_mvvm/res/components/round_button.dart';
import 'package:getx_mvvm/res/routes/app_exports.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Languages.emailHint.tr),
      ),
      body: InternetExceptionWidget(onPress: () {
        Utils.toastMessageCenter("Lion");
      },),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Utils.toastMessageCenter("Lion");
        },
      ),
    );
  }
}
