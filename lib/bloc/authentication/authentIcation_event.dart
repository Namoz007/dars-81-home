sealed class AuthenticationEvent{}

final class StartAuthenticationEvent extends AuthenticationEvent{}

final class LogInAuthenticationEvent extends AuthenticationEvent{
  String email;
  String password;

  LogInAuthenticationEvent({required this.email,required this.password,});
}

final class SignUpAuthenticationEvent extends AuthenticationEvent{
  String email;
  String password;

  SignUpAuthenticationEvent({required this.email,required this.password,});
}