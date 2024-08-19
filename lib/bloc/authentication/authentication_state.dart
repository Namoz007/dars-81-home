sealed class AuthenticationState{}

final class InitialAuthenticationState extends AuthenticationState{}

final class LoadingAuthenticationState extends AuthenticationState{}

final class LoadedAuthenticationState extends AuthenticationState{}

final class ErrorAuthenticationState extends AuthenticationState{
  String message;

  ErrorAuthenticationState(this.message);
}