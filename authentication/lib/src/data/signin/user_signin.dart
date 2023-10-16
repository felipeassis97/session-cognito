import 'package:amplify_flutter/amplify_flutter.dart';

import '../../domain/auth_print_log.dart';
import '../../domain/auth_user_response.dart';

class UserSignin {
  static Future<AuthUserResponse> signIn(
      {required String user, required String password}) async {
    try {
      final response =
          await Amplify.Auth.signIn(username: user, password: password);
      successLog('Sign in success');
      return AuthUserResponse.fromCognitoSuccess(response.toJson());
    } on AuthException catch (exception) {
      errorLog('Sign in error - ${exception.message}');
      return AuthUserResponse.fromCognitoException(exception);
    }
  }

  static Future<AuthUserResponse> signout() async {
    try {
      final response = await Amplify.Auth.signOut();
      successLog('Sign out success');
      return AuthUserResponse.fromCognitoSuccess(response.toJson());
    } on AuthException catch (exception) {
      errorLog('Sign out error - ${exception.message}');
      return AuthUserResponse.fromCognitoException(exception);
    }
  }
}
