import 'package:dars_81_home/data/model/group.dart';
import 'package:dars_81_home/data/model/user_model.dart';
import 'package:dars_81_home/services/admin_services.dart';
import 'package:dars_81_home/utils/app_utils.dart';

class AdminRepositories{
  final AdminServices _services;

  AdminRepositories({required AdminServices services}) : _services = services;

  Future<List<UserModel>> getAllUsers() async{
    return await _services.getAllUsers();
  }

  Future<List<Group>> getAllMyGroups() async{
    if(AppUtils.userModel!.roleId == 3){
      return await _services.getAllGroups();
    }
    return [];
  }
}