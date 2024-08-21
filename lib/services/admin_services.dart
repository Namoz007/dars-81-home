import 'package:dars_81_home/data/model/group.dart';
import 'package:dars_81_home/data/model/user_model.dart';
import 'package:dars_81_home/services/dio_file.dart';

class AdminServices{
  final _dio = DioFile.getInstance().dio;
  
  Future<List<UserModel>> getAllUsers() async{
    final response = await _dio.get('/users');
    List<dynamic> datas = response.data['data'];
    for(int i = 0;i < datas.length;i++)
      UserModel.fromJson(datas[i]);
    return [for(int i = 0;i < datas.length;i++) UserModel.fromJson(datas[i])];
  }

  // Future<void> getAllMyGroups()

  Future<List<Group>> getAllGroups() async{
    final response = await _dio.get("/groups");
    List<dynamic> datas = response.data['data'];
    return [for(int i = 0;i < datas.length;i++) Group.fromJson(datas[i])];
  }
}