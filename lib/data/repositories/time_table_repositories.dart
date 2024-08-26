import 'package:dars_81_home/services/time_table_services.dart';

class TimeTableRepositories{
  final TimeTableServices _services;

  TimeTableRepositories({required TimeTableServices services}) : _services = services;

  Future<void> getAllTimeTables() async{
    await _services.getAllTimeTables();
  }
}
