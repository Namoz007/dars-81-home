import 'dart:io';

import 'package:dars_81_home/data/model/user_model.dart';
import 'package:dars_81_home/services/dio_file.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserServices {
  final _dio = DioFile.getInstance().dio;

  Future<UserModel> getMyUser() async {
    dynamic response = '';
    try{
      response = await _dio.get(
        "/user",
      );
    }on DioException catch(e){
      print("dio xatosi $e");
    }catch(e){
      print('Bu oddi xato $e');
    }
    return UserModel.fromJson(response.data['data']);
  }

  Future<void> updateProfile(String name,String email,String phoneNumber,File? file,) async{
    try{

      FormData formData = FormData.fromMap({
        "photo": await MultipartFile.fromFile(
          file!.path,
          filename: 'new.jpg',
        ),
        "name": name,
        "email": email,
        "phone": phoneNumber,
      });

      final response = await _dio.post(
        "/profile/update",
        data: formData,
      );
      print("bu response ${response.data}");
    }on DioException catch(e){
      print("dio xato ${e.response?.data}");
    }catch(e){
      print("oddiy xato $e");
    }
  }
}
