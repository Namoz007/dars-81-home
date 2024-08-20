import 'package:dars_81_home/data/model/user_model.dart';
import 'package:dars_81_home/services/user_services.dart';

class UserRepositories{
  final UserServices _services;

  UserRepositories({required UserServices services}) : _services = services;

  Future<UserModel> getMyUser() async{
    return await _services.getMyUser();
  }
}