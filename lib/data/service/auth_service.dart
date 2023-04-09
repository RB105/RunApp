
import 'package:dio/dio.dart';
import 'package:runningapp/data/model/response_model.dart';

class AuthService {
  // Sign up
  Future<dynamic> register(
      {required String phone,
      required String username,
      required String password}) async {
    try {
      Response response =
          await Dio().post("http://192.168.1.85:4000/register",
              data: {
                "phone": phone,
                "username": username,
                "password": password,
              },
              options: Options(contentType: "application/json"));
      return ResponseModel.fromJson(response.data);
    }  catch (e) {
      return e.toString();
    }
  }

  // Sign in
  Future<dynamic> login(
      {required String phone, required String password}) async {
    try {
      Response response = await Dio().post("http://192.168.1.85:4000/login",
          data: {"phone": phone, "password": password},
          options: Options(contentType: "application/json"));
      if (response.statusCode == 200) {
        return ResponseModel.fromJson(response.data);
      } else {
        return ResponseModel.fromJson(response.data);
      }
    }   catch (e) {
      return e.toString();
    }
  }
}
