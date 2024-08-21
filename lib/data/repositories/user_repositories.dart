import 'dart:io';

import 'package:dars_81_home/data/model/user_model.dart';
import 'package:dars_81_home/services/user_services.dart';

class UserRepositories {
  final UserServices _services;

  UserRepositories({required UserServices services}) : _services = services;

  Future<UserModel> getMyUser() async {
    return await _services.getMyUser();
  }

  Future<void> updateProfile(
    String name,
    String email,
    String phoneNumber,
    File? file,
  ) async {
    _services.updateProfile(name, email, phoneNumber, file);
  }
}
