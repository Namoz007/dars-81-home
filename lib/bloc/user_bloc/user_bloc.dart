import 'package:bloc/bloc.dart';
import 'package:dars_81_home/bloc/user_bloc/user_bloc_event.dart';
import 'package:dars_81_home/bloc/user_bloc/user_bloc_state.dart';
import 'package:dars_81_home/data/model/user_model.dart';
import 'package:dars_81_home/data/repositories/user_repositories.dart';

class UserBloc extends Bloc<UserBlocEvent,UserBlocState>{
  final UserRepositories _repositories;
  UserModel? model;

  UserBloc({required UserRepositories repo}) : _repositories = repo,super(InitialUserBlocState()){
    on<GetMyUserBlocEvent>(_getMyUser);
    on<UpdateMyUserBlocEvent>(_updateProfile);
  }

  void _updateProfile(UpdateMyUserBlocEvent event,emit) async{
    emit(LoadingUserBlocState());
    await _repositories.updateProfile(event.name, event.email, event.phoneNumber, event.imgFile);
    model!.email = event.email;
    model!.name = event.name;
    model!.phone = event.phoneNumber;
    emit(LoadedUserBlocState(model!));
  }

  void _getMyUser(GetMyUserBlocEvent event,emit) async{
    emit(LoadingUserBlocState());
    model = await _repositories.getMyUser();
    emit(LoadedUserBlocState(model!));
  }
}