import 'package:dars_81_home/data/model/registration_request.dart';

sealed class AuthenticationEvent{}

final class StartAuthenticationEvent extends AuthenticationEvent{}

final class LogInAuthenticationEvent extends AuthenticationEvent{
  RegistrationRequest query;

  LogInAuthenticationEvent({required this.query,});
}

final class SignUpAuthenticationEvent extends AuthenticationEvent{
  RegistrationRequest query;

  SignUpAuthenticationEvent({required this.query});
}

final class ForgotPasswordAuthenticationEvent extends AuthenticationEvent{
  String email;

  ForgotPasswordAuthenticationEvent(this.email);
}

final class LogOutAuthenticationEvent extends AuthenticationEvent{}