import 'dart:convert';

import 'package:dars_81_home/data/model/registration_request.dart';
import 'package:dars_81_home/services/dio_file.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationServices {
  final _dio = DioFile.getInstance().dio;

  Future<String> signInOrSignUp(
      RegistrationRequest request, String query) async {
    dynamic response = '';
    try {
      if (query == 'signin') {
        response = await _dio.post(
          "/login",
          data: {
            "phone": request.phoneNumber,
            "password": request.password,
          },
        );
      } else {
        response = await _dio.post("/register", data: request.toMap());
      }
      final pref = await SharedPreferences.getInstance();
      pref.setString("token", response.data['data']['token']);
    } on DioException catch (e) {
      return e.toString();
    } catch (e) {
      return e.toString();
    }
    return '';
  }

  Future<String> resetPasswords(String email) async {
    return '';
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("token");
    try {
      final response = await _dio.post(
        "/logout",
      );
      await prefs.remove('userData');
    } on DioException {
      rethrow;
    } catch (e) {
      print("Error:  $e");
      rethrow;
    }
  }
}
