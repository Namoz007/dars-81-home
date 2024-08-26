import 'package:dars_81_home/services/dio_file.dart';

class TimeTableServices{
  final _dio = DioFile.getInstance().dio;

  Future<void> getAllTimeTables() async{
    final response = await _dio.get("/group-timetable/2");
    print("bu response ${response.data}");
  }
}