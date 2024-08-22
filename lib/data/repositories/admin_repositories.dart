import 'package:dars_81_home/data/model/group.dart';
import 'package:dars_81_home/data/model/teacher.dart';
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
    return await _services.getAllGroups();
  }

  Future<List<Teacher>> getAllMyTeachers() async{
    return await _services.getAllTeachers();
  }

  Future<List<Student>> getAllStudent() async{
    return await _services.getAllStudent();
  }

  Future<Group> createGroup(Group group) async{
    return await _services.createGroup(group);
  }

  Future<void> updateGroup(Group group) async{
    await _services.updateGroup(group);
  }
}