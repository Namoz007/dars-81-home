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
  }

  void _signInAuthentication(LogInAuthenticationEvent event,emit) async{
    emit(LoadingAuthenticationState());
    await _repositories.signInUser(event.email, event.password);
    emit(LoadedAuthenticationState());
  }

  void _signUpAuthentication(SignUpAuthenticationEvent event,emit) async{
    emit(LoadingAuthenticationState());
    await _repositories.signUpUser(event.email, event.password);
    emit(LoadedAuthenticationState());
  }

  void _startAuthentication(StartAuthenticationEvent event,emit){
    emit(LoadedAuthenticationState());
  }
}