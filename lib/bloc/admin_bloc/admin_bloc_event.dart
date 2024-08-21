import 'package:dars_81_home/data/model/user_model.dart';

sealed class AdminBlocEvent{}

final class GetAllUserAdminBlocEvent extends AdminBlocEvent{}

final class GetAllStudentAdminBlocEvent extends AdminBlocEvent{}

final class GetAllTeacherAdminBlocEvent extends AdminBlocEvent{}

final class GetAllAdminBlocEvent extends AdminBlocEvent{}

final class GetAllMyGroupsAdminBlocEvent extends AdminBlocEvent{}