import 'package:dars_81_home/data/model/group.dart';
import 'package:dars_81_home/data/model/teacher.dart';
import 'package:dars_81_home/data/model/user_model.dart';
import 'package:dars_81_home/services/dio_file.dart';
import 'package:dars_81_home/utils/app_utils.dart';

class AdminServices {
  final _dio = DioFile.getInstance().dio;

  Future<List<UserModel>> getAllUsers() async {
    final response = await _dio.get('/users');
    List<dynamic> datas = response.data['data'];
    for (int i = 0; i < datas.length; i++) UserModel.fromJson(datas[i]);
    return [
      for (int i = 0; i < datas.length; i++) UserModel.fromJson(datas[i])
    ];
  }

  Future<List<Group>> getAllGroups() async {
    dynamic response = '';
    if(AppUtils.userModel!.roleId == 3){
      response = await _dio.get("/groups");
    }else if(AppUtils.userModel!.roleId == 1){
      response = await _dio.get("/student/groups");
    }
    List<dynamic> datas = response.data['data'];
    return [for (int i = 0; i < datas.length; i++) Group.fromJson(datas[i])];
  }

  Future<List<Teacher>> getAllTeachers() async {
    final response = await _dio.get("/users", queryParameters: {"role_Id": 2});
    List<dynamic> datas = response.data['data'];
    return [for (int i = 0; i < datas.length; i++) Teacher.fromJson(datas[i])];
  }

  Future<List<Student>> getAllStudent() async {
    final response = await _dio.get("/users", queryParameters: {"role_id": 1});
    List<dynamic> datas = response.data['data'];
    return [for (int i = 0; i < datas.length; i++) Student.fromJson(datas[i])];
  }

  Future<void> updateGroup(Group group) async{
    final response = await _dio.put(
      '/groups/${group.id}',
      data: {
        "name": "${group.name}",
        "main_teacher_id": group.mainTeacherId,
        "assistant_teacher_id": group.assistantTeacherId
      },
    );
    await addStudentToGroup(group.id, group.students);
  }

  Future<Group> createGroup(Group group) async {
    final response = await _dio.post(
      '/groups',
      data: {
        "name": "${group.name}",
        "main_teacher_id": group.mainTeacherId,
        "assistant_teacher_id": group.assistantTeacherId
      },
    );
    await addStudentToGroup(response.data['data']['id'], group.students);
    return Group(id: response.data['data']['id'], name: group.name, mainTeacherId: group.mainTeacherId, assistantTeacherId: group.assistantTeacherId, createdAt: group.createdAt, updatedAt: group.updatedAt, mainTeacher: group.mainTeacher, assistantTeacher: group.assistantTeacher, students: group.students);
  }

  Future<void> addStudentToGroup(int groupdId,List<Student> _students) async{
    print( _students.map((element) => element.id).toList());
    print("bu guruh id$groupdId");
    if(_students.length != 0){
      final response = await _dio.post("/groups/$groupdId/students",data: {
        "students": _students.map((element) => element.id).toList(),
      });
    }
  }
}
