import 'package:bloc/bloc.dart';
import 'package:dars_81_home/bloc/authentication/authentIcation_event.dart';
import 'package:dars_81_home/bloc/authentication/authentication_state.dart';
import 'package:dars_81_home/data/repositories/authentication_repositories.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent,AuthenticationState>{
  final AuthenticationRepositories _repositories;
  AuthenticationBloc({required AuthenticationRepositories repo}) : _repositories = repo,super(InitialAuthenticationState()){
    on<StartAuthenticationEvent>(_startAuthentication);
    on<SignUpAuthenticationEvent>(_signUpAuthentication);
    on<LogInAuthenticationEvent>(_signInAuthentication);
    on<ForgotPasswordAuthenticationEvent>(_forgotPassword);
    on<LogOutAuthenticationEvent>(_logOutUser);
  }

  void _forgotPassword(ForgotPasswordAuthenticationEvent event,emit){
    _repositories.resetPassword(event.email);
    emit(LoadedAuthenticationState());
  }

  void _signInAuthentication(LogInAuthenticationEvent event,emit) async{
    emit(LoadingAuthenticationState());
    final response = await _repositories.signInUser(event.query);
    emit(ErrorAuthenticationState(response));
  }

  void _signUpAuthentication(SignUpAuthenticationEvent event,emit) async{
    emit(LoadingAuthenticationState());
    final response = await _repositories.signUpUser(event.query);
    emit(ErrorAuthenticationState(response));
  }

  void _startAuthentication(StartAuthenticationEvent event,emit){
    emit(LoadedAuthenticationState());
  }

  void _logOutUser(LogOutAuthenticationEvent event,emit) {
    emit(LoadingAuthenticationState());
    _repositories.logOut();
    emit(InitialAuthenticationState());
  }
}