import 'package:amplify_flutter/amplify_flutter.dart';

import '../../domain/auth_print_log.dart';
import '../../domain/auth_user_response.dart';

class UserSignup {
  static Future<AuthUserResponse> createUser({
    required String user,
    required String password,
    String? phoneNumber,
    String? birthdate,
    String? name,
  }) async {
    try {
      Map<AuthUserAttributeKey, String> atributes = {};

      if (phoneNumber != null) {
        atributes.putIfAbsent(
            AuthUserAttributeKey.phoneNumber, () => phoneNumber);
      }
      if (birthdate != null) {
        atributes.putIfAbsent(AuthUserAttributeKey.birthdate, () => birthdate);
      }
      if (name != null) {
        atributes.putIfAbsent(AuthUserAttributeKey.name, () => name);
      }

      var response = await Amplify.Auth.signUp(
        username: user,
        password: password,
        options: SignUpOptions(
          userAttributes: atributes,
        ),
      );

      successLog('Create user success');
      return AuthUserResponse.fromCognitoSuccess(response.toJson());
    } on AuthException catch (exception) {
      errorLog('Create user error - ${exception.message}');
      return AuthUserResponse.fromCognitoException(exception);
    }
  }
}
