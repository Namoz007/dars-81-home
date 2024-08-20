import 'package:dars_81_home/data/model/user_model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserServices {
  final _url = "http://millima.flutterwithakmaljon.uz";
  final _dio = Dio();

  Future<UserModel> getMyUser() async {
    final pref = await SharedPreferences.getInstance();
    final token = pref.getString("token");
    final response = await _dio.get(
      "${_url}/api/user",
      options: Options(
        headers: {"Authorization": 'Bearer ${token}'},
      ),
    );

    return UserModel.fromJson(response.data['data']);
  }
}
