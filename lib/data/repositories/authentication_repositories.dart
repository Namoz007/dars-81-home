import 'package:dars_81_home/services/authentication_services.dart';

class AuthenticationRepositories{
  final AuthenticationServices _services;

  AuthenticationRepositories({required AuthenticationServices servic}) : _services = servic;

  Future<String> signInUser(String email,String password) async{
    return await _services.signInOrSignUp(email, password, 'signIn');
  }

  Future<String> signUpUser(String email,String password) async{
    return await _services.signInOrSignUp(email, password, 'signUp');
  }
}