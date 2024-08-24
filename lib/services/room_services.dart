import 'package:dars_81_home/data/model/room_model.dart';
import 'package:dars_81_home/services/dio_file.dart';

class RoomServices{

  final _dio = DioFile.getInstance().dio;

  Future<void> updateRoom({required int id, required String name}) async{
    await _dio.put("/rooms/$id",data: {
      "name": name,
    });
  }

  Future<void> createNewRoom(Room room) async {
    final response = await _dio.post("/rooms", data: room.toJson());
  }

  Future<List<Room>> getAllGroups() async{
    List<Room> _rooms = [];
    final response = await _dio.get("/rooms");
    List<dynamic> datas = response.data['data'];
    for(int i = 0;i < datas.length;i++)
      _rooms.add(Room.fromJson(datas[i]));

    return _rooms;
  }
  
  Future<void> deleteRoom(int id) async{
    final response = await _dio.delete("/rooms/$id");
  }

}
