import 'package:dio/dio.dart';
import 'package:runningapp/data/model/history_model.dart';
import 'package:runningapp/data/model/profile_model.dart';
import 'package:runningapp/data/model/status_model.dart';

class HomeGetServices {
  Future<dynamic> getProfile() async {
    try {
      Response response = await Dio().get("http://192.168.1.85:4000/home/profile");
      if (response.statusCode == 200) {
        return ProfileModel.fromJson(response.data);
      } else {
        return response.statusMessage.toString();
      }
    } catch (e) {
      return e.toString();
    }
  }
  Future<dynamic> getStatus() async {
    try {
      Response response = await Dio().get("http://192.168.1.85:4000/home/status");
      if (response.statusCode == 200) {
        return StatusModel.fromJson(response.data);
      } else {
        return response.statusMessage.toString();
      }
    } catch (e) {
      return e.toString();
    }
  }
  Future<dynamic> getHistory() async {
    try {
      Response response = await Dio().get("http://192.168.1.85:4000/home/history");
      if (response.statusCode == 200) {
        return HistoryModel.fromJson(response.data);
      } else {
        return response.statusMessage.toString();
      }
    } catch (e) {
      return e.toString();
    }
  }
}
