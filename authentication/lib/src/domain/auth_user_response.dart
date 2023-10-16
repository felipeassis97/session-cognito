import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';

class AuthUserResponse {
  final bool? success;
  final Map<String, dynamic>? data;
  final String? message;
  final AuthUserStatus? status;

  AuthUserResponse({
    this.success,
    this.message,
    this.status,
    this.data,
  });

  factory AuthUserResponse.fromCognitoException(AuthException exception) {
    return AuthUserResponse(
      success: false,
      message: exception.message,
      status: fromCognitoException(exception),
    );
  }
  factory AuthUserResponse.fromCognitoSuccess(Map<String, dynamic> data) {
    return AuthUserResponse(
      success: true,
      data: data,
    );
  }
}

enum AuthUserStatus {
  userNotFound,
  invalidParameter,
  notAuthorized,
  validationError,
  netWorkError,
  usernameExists,
  invalidPassword,
  codeMismatch,
  unknown,
}

AuthUserStatus fromCognitoException(AuthException e) {
  if (e is UserNotFoundException) {
    return AuthUserStatus.userNotFound;
  } else if (e is InvalidParameterException) {
    return AuthUserStatus.invalidParameter;
  } else if (e is NotAuthorizedServiceException) {
    return AuthUserStatus.notAuthorized;
  } else if (e is InvalidParameterException) {
    return AuthUserStatus.validationError;
  } else if (e is NetworkException) {
    return AuthUserStatus.netWorkError;
  } else if (e is UsernameExistsException) {
    return AuthUserStatus.usernameExists;
  } else if (e is InvalidPasswordException) {
    return AuthUserStatus.invalidPassword;
  } else if (e is CodeMismatchException) {
    return AuthUserStatus.codeMismatch;
  } else {
    return AuthUserStatus.unknown;
  }
}
