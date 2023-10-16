import 'package:authentication/src/domain/auth_user_response.dart';

abstract class AuthUserApp {
  Future<AuthUserResponse> getToken();
  Future<AuthUserResponse> getCurrentUser();

  Future<AuthUserResponse> signout();
  Future<AuthUserResponse> signIn({
    required String user,
    required String password,
  });
  Future<AuthUserResponse> createUser({
    required String user,
    required String password,
    String? phoneNumber,
    String? birthdate,
    String? name,
  });
}
