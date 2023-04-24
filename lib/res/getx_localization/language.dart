

import 'package:get/get.dart';

class Languages extends Translations {

  static const String emailHint = 'email_hint';
  static const String internetExceptionText = 'internet_exception';

  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      'email_hint': 'Enter email',
      'internet_exception': "we're unable to show results.\n Please check your data\n connection."
    },
    'hi_IN': {
      'email_hint': 'ईमेल दर्ज करें'
    }
  };
}