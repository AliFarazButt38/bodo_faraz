import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FacebookAuthHelper {
  static Future<void> login() async {
    final LoginResult result = await FacebookAuth.instance.login();

    if (result.status == LoginStatus.success) {
      final userData = await FacebookAuth.instance.getUserData();
      print(userData);
    } else {
      print(result.status);
      print(result.message);
    }
  }
}
