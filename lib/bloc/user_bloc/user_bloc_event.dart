import 'dart:io';

sealed class UserBlocEvent{}

final class GetMyUserBlocEvent extends UserBlocEvent{}

final class UpdateMyUserBlocEvent extends UserBlocEvent{
  String email;
  String phoneNumber;
  String name;
  File? imgFile;

  UpdateMyUserBlocEvent({required this.email,required this.phoneNumber,required this.name,this.imgFile,});
}

final class RefreshMyUserUserBlocEvent extends UserBlocEvent{}