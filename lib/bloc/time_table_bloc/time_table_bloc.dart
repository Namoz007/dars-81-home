import 'package:bloc/bloc.dart';
import 'package:dars_81_home/bloc/time_table_bloc/time_table_bloc_event.dart';
import 'package:dars_81_home/bloc/time_table_bloc/time_table_bloc_state.dart';
import 'package:dars_81_home/data/repositories/time_table_repositories.dart';

class TimeTableBloc extends Bloc<TimeTableBlocEvent,TimeTableBlocState>{
  final TimeTableRepositories _repositories;

  TimeTableBloc({required TimeTableRepositories repo}) : _repositories = repo,super(InitialTimeTableBlocState()){
    on<GetAllTimeTableBlocEvent>(_getAllTimeTable);
    on<GetAllServicesTimeTableBlocEvent>(_getAllTimeTableFromServices);
  }

  void _getAllTimeTable(GetAllTimeTableBlocEvent event,emit)async{
    emit(LoadingTimeTableBlocState());
    await _repositories.getAllTimeTables();
    emit(LoadedTimeTablesTimeTableBlocState());
  }

  void _getAllTimeTableFromServices(GetAllServicesTimeTableBlocEvent event,emit) async{
    //
  }
}