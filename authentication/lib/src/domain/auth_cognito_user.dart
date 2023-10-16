import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';

import '../../authentication.dart';
import '../data/signin/user_signin.dart';
import '../data/signup/user_signup.dart';
import '../data/user_information/user_information.dart';
import 'auth_print_log.dart';

class AuthCogntoUser implements AuthUserApp {
  final String credentials;

  AuthCogntoUser({required this.credentials}) : super() {
    _configureAmplify();
  }

  @override
  Future<AuthUserResponse> getToken() async => await UserInformation.getToken();

  @override
  Future<AuthUserResponse> signIn(
          {required String user, required String password}) async =>
      await UserSignin.signIn(user: user, password: password);

  @override
  Future<AuthUserResponse> signout() async => UserSignin.signout();

  @override
  Future<AuthUserResponse> getCurrentUser() async =>
      await UserInformation.getCurrentUser();

  @override
  Future<AuthUserResponse> createUser({
    required String user,
    required String password,
    String? phoneNumber,
    String? birthdate,
    String? name,
  }) async =>
      await UserSignup.createUser(
          user: user,
          password: password,
          phoneNumber: phoneNumber,
          birthdate: birthdate,
          name: name);

  Future<void> _configureAmplify() async {
    try {
      final auth = AmplifyAuthCognito();
      await Amplify.addPlugin(auth);
      await Amplify.configure(credentials);
      successLog('Amplify configuration success');
    } on Exception catch (e) {
      successLog('Amplify configuration error: $e');
    }
  }
}
