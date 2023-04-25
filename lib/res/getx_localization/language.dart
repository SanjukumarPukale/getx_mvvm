

import 'package:get/get.dart';

class Languages extends Translations {

  static const String emailHint = 'email_hint';
  static const String internetExceptionText = 'internet_exception';
  static const String welcomeBackText = 'welcome_back';
  static const String login = 'login';
  static const String passwordHint = 'password_hint';

  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      'email_hint': 'Email',
      'password_hint': 'Password',
      'internet_exception': "we're unable to show results.\n Please check your data\n connection.",
      'welcome_back': "'Welcome\nBack'",
      'login': 'Login'
    },
    'hi_IN': {
      'email_hint': 'ईमेल दर्ज करें'
    }
  };
}