import 'package:authentication/authentication.dart';
import 'package:get_it/get_it.dart';
import 'package:sears_test_cognito/amplifyconfiguration.dart';

final getIt = GetIt.instance;

void setup() {
  GetIt.I.registerSingleton<AuthUserApp>(
      AuthCogntoUser(credentials: amplifyconfig));
}
