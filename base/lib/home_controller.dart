import 'dart:developer';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'amplifyconfiguration.dart';

class HomeController {
  Future<void> current() async {
    try {
      final currentUser = await Amplify.Auth.getCurrentUser();
      log(currentUser.toString());
    } on Exception catch (e) {
      log(e.runtimeType.toString());
      safePrint('An error occurred Create user: $e');
    }
  }

  Future<void> signin() async {
    try {
      final result = await Amplify.Auth.signIn(
          username: 'felipeassis97@gmail.com', password: 'Kjgd@485');
      safePrint('\x1B[32m\u2713 Sucesso!\x1B[0m');

      safePrint(result);
    } on Exception catch (e) {
      log(e.runtimeType.toString());
      safePrint('An error occurred Signin user: $e');
    }
  }

  Future<void> getToken() async {
    try {
      final ses = (await Amplify.Auth.fetchAuthSession()) as CognitoAuthSession;
      inspect(ses);
      log('${ses.userPoolTokensResult.value.idToken.raw}');
    } on Exception catch (e) {
      log(e.runtimeType.toString());
      safePrint('An error occurred Signin user: $e');
    }
  }

  Future<void> configureAmplify() async {
    try {
      final auth = AmplifyAuthCognito();
      await Amplify.addPlugin(auth);

      await Amplify.configure(amplifyconfig);
    } on Exception catch (e) {
      log(e.runtimeType.toString());
      safePrint('An error occurred configuring Amplify: $e');
    }
  }

  Future<void> code() async {
    try {
      var ret = await Amplify.Auth.confirmSignUp(
          username: 'felipe.assis@softdesign.com.br',
          confirmationCode: '001620');
      log(ret.toString());
    } on Exception catch (e) {
      safePrint('An error occurred Create user: $e');
    }
  }

  Future<void> create() async {
    try {
      var ret = await Amplify.Auth.signUp(
        username: 'felipe.assis@softdesign.com.br',
        password: 'Kjgd@485',
      );
      log(ret.toString());
    } on Exception catch (e) {
      log(e.runtimeType.toString());
      safePrint('An error occurred CONFIRM user: $e');
    }
  }

  Future<void> signOut() async {
    try {
      final result = await Amplify.Auth.signOut();
      log('Success Signout');
      log('\x1B[31m\u2718 Erro!\x1B[0m');
      safePrint(result);
    } on Exception catch (e) {
      safePrint('An error occurred SIGNOUT user: $e');
    }
  }

  Future<void> resendCode() async {
    try {
      var ret = await Amplify.Auth.resendSignUpCode(
          username: 'felipe.assis@softdesign.com.br');
      log(ret.toString());
    } on Exception catch (e) {
      safePrint('An error occurred Create user: $e');
    }
  }

  Future<void> updatePassword() async {
    try {
      var ret = await Amplify.Auth.updatePassword(
        oldPassword: 'Kjgd@485',
        newPassword: 'j12',
      );
      log(ret.toString());
    } on Exception catch (e) {
      log(e.runtimeType.toString());
      safePrint('An error occurred Update pass user: $e');
    }
  }

  Future<void> resetPassword() async {
    try {
      final ret = await Amplify.Auth.resetPassword(
        username: 'felipe.assis@softdesign.com.br',
      );
      log(ret.toString());
    } on Exception catch (e) {
      log(e.runtimeType.toString());
      safePrint('An error occurred Update pass user: $e');
    }
  }

  Future<void> confirmResetPassword() async {
    try {
      final ret = await Amplify.Auth.confirmResetPassword(
        username: 'felipe.assis@softdesign.com.br',
        newPassword: 'Kjgd@485',
        confirmationCode: '231215',
      );
      log(ret.toString());
    } on Exception catch (e) {
      CodeMismatchException;
      log(e.runtimeType.toString());
      safePrint('An error occurred confirmResetPassword  user: $e');
    }
  }
}
