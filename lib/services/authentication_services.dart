import 'dart:convert';

import 'package:dars_81_home/data/model/registration_request.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationServices{
  final _url = "http://millima.flutterwithakmaljon.uz";
  final _dio = Dio();

  Future<String> signInOrSignUp(RegistrationRequest request,String query) async {
    dynamic response = '';
    try {
      if(query == 'signin'){
        response = await _dio.post("${_url}/api/login",data: {
          "phone": request.phoneNumber,
          "password": request.password,
        });
      }else{
        response = await _dio.post("${_url}/api/register",data: request.toMap());
      }
      final pref = await SharedPreferences.getInstance();
      pref.setString("token", response.data['data']['token']);
    }on DioException catch(e){
      return e.toString();
    }catch(e){
      return e.toString();
    }
    return '';
  }

  Future<String> resetPasswords(String email) async{
    return '';
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token").toString();
    prefs.remove("token");
    try {
      final response = await _dio.post(
        "http://millima.flutterwithakmaljon.uz/api/logout",
        options: Options(
          headers: {"Authorization": 'Bearer ${token}'},
        ),
      );
      await prefs.remove('userData');
      final a = prefs.getString("token");
    } on DioException {
      rethrow;
    } catch (e) {
      print("Error:  $e");
      rethrow;
    }
  }

}