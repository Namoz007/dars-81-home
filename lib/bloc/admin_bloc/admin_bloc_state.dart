import 'package:dars_81_home/data/model/group.dart';
import 'package:dars_81_home/data/model/user_model.dart';

sealed class AdminBlocState{}

final class InitialAdminBlocState extends AdminBlocState{}

final class LoadingAdminBlocState extends AdminBlocState{}

final class LoadedAdminBlocState extends AdminBlocState{
  List<UserModel> users;

  LoadedAdminBlocState(this.users);
}

final class LoadedAllGroups extends AdminBlocState {
  List<Group> groups;

  LoadedAllGroups(this.groups);
}

final class ErrorAdminBlocState extends AdminBlocState{
  String message;

  ErrorAdminBlocState(this.message);
}