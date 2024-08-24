import 'package:bloc/bloc.dart';
import 'package:dars_81_home/bloc/authentication/authentIcation_event.dart';
import 'package:dars_81_home/bloc/authentication/authentication_state.dart';
import 'package:dars_81_home/data/repositories/authentication_repositories.dart';
import 'package:dars_81_home/utils/app_utils.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent,AuthenticationState>{
  final AuthenticationRepositories _repositories;
  AuthenticationBloc({required AuthenticationRepositories repo}) : _repositories = repo,super(InitialAuthenticationState()){
    on<StartAuthenticationEvent>(_startAuthentication);
    on<SignUpAuthenticationEvent>(_signUpAuthentication);
    on<LogInAuthenticationEvent>(_signInAuthentication);
    // on<ForgotPasswordAuthenticationEvent>(_forgotPassword);
    on<LogOutAuthenticationEvent>(_logOutUser);
    on<ClearErrorMessageAuthenticationEvent>(_clearErrorMessage);
  }

  void _clearErrorMessage(ClearErrorMessageAuthenticationEvent event,emit){
    emit(ErrorAuthenticationState(''));
  }

  // void _forgotPassword(ForgotPasswordAuthenticationEvent event,emit){
  //   _repositories.resetPassword(event.email);
  //   emit(LoadedAuthenticationState());
  // }

  void _signInAuthentication(LogInAuthenticationEvent event,emit) async{
    emit(LoadingAuthenticationState());
    final response = await _repositories.signInUser(event.requestModel);
    if(response == ''){
      final a = await _repositories.getMyuser();
      emit(ComedUserAuthenticationState(a));
    }else{
      emit(ErrorAuthenticationState(response));
    }
  }

  void _signUpAuthentication(SignUpAuthenticationEvent event,emit) async{
    emit(LoadingAuthenticationState());
    final response = await _repositories.signUpUser(event.model);
    if(response == ''){
      emit(ComedUserAuthenticationState(await _repositories.getMyuser()));
    }else{
      emit(ErrorAuthenticationState(response));
    }
  }

  void _startAuthentication(StartAuthenticationEvent event,emit) async{
    emit(LoadingAuthenticationState());
    final response = await _repositories.userLoged();
    if(response){
      emit(ComedUserAuthenticationState(await _repositories.getMyuser()));
    }else{
      emit(UnAuthenticatedAuthenticationState());
    }
  }

  void _logOutUser(LogOutAuthenticationEvent event,emit) {
    emit(LoadingAuthenticationState());
    _repositories.logOut();
    emit(UnAuthenticatedAuthenticationState());
  }
}