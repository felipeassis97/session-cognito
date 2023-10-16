import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';

import '../../../authentication.dart';
import '../../domain/auth_print_log.dart';

class UserInformation {
  static Future<AuthUserResponse> getToken() async {
    try {
      final ses = (await Amplify.Auth.fetchAuthSession()) as CognitoAuthSession;
      final response = {
        'token': ses.userPoolTokensResult.value.idToken.raw,
      };
      successLog('Get token success');
      successLog(ses.userPoolTokensResult.value.idToken.raw);
      return AuthUserResponse.fromCognitoSuccess(response);
    } on AuthException catch (exception) {
      errorLog('Get token error - ${exception.message}');
      return AuthUserResponse.fromCognitoException(exception);
    }
  }

  static Future<AuthUserResponse> getCurrentUser() async {
    try {
      final response = await Amplify.Auth.getCurrentUser();
      successLog('Get current user success');
      return AuthUserResponse.fromCognitoSuccess(response.toJson());
    } on AuthException catch (exception) {
      errorLog('Get current user error - ${exception.message}');
      return AuthUserResponse.fromCognitoException(exception);
    }
  }
}
