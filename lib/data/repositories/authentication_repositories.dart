import 'package:dars_81_home/data/model/registration_request.dart';
import 'package:dars_81_home/services/authentication_services.dart';

class AuthenticationRepositories{
  final AuthenticationServices _services;

  AuthenticationRepositories({required AuthenticationServices servic}) : _services = servic;

  Future<String> signInUser(RegistrationRequest request) async{
    return await _services.signInOrSignUp(request, 'signin');
  }

  Future<String> signUpUser(RegistrationRequest request) async{
    return await _services.signInOrSignUp(request, 'signup');
  }

  Future<String> resetPassword(String email) async{
    return await _services.resetPasswords(email);
  }

  Future<void> logOut() async{
    await _services.logout();
  }
}