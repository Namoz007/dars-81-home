sealed class TimeTableBlocState{}

final class InitialTimeTableBlocState extends TimeTableBlocState{}

final class LoadingTimeTableBlocState extends TimeTableBlocState{}

final class LoadedTimeTablesTimeTableBlocState extends TimeTableBlocState{}

final class ErrorTimeTableBlocState extends TimeTableBlocState{
  String message;

  ErrorTimeTableBlocState({required this.message});
}