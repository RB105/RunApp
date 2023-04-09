import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:runningapp/data/model/response_model.dart';
import 'package:runningapp/data/service/auth_service.dart';
import 'package:runningapp/view/home_page.dart';

class AuthProvider extends ChangeNotifier {
  // instance from service
  AuthService service = AuthService();

  //controllers
  TextEditingController registerPhonecontroller = TextEditingController();
  TextEditingController registerPasswordController = TextEditingController();
  TextEditingController registerUsernameController = TextEditingController();

  TextEditingController loginPhonecontroller = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();

  //variables
  bool isLoading = false;
  bool isRegister = true;

  // for Auth Page animation
  void turnAround(bool value) {
    isRegister = value;
    notifyListeners();
  }

  // Sign Up
  Future<void> register(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    await service
        .register(
            username: registerUsernameController.text,
            phone: registerPhonecontroller.text,
            password: registerPasswordController.text)
        .then((dynamic response) {
      if (response is ResponseModel) {
        if (response.status == true) {
          isLoading = false;
          notifyListeners();
          showToastHelper(response.message.toString());
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
              (route) => false);
        } else {
          isLoading = false;
          notifyListeners();
          showToastHelper(response.message.toString());
        }
      } else {
        isLoading = false;
        notifyListeners();
        showToastHelper(response.toString());
      }
    });
  }

  // Sign in
  Future<void> login(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    await service
        .login(
            phone: loginPhonecontroller.text,
            password: loginPasswordController.text)
        .then((dynamic response) {
      if (response is ResponseModel) {
        if (response.status == true) {
          isLoading = false;
          notifyListeners();
          showToastHelper(response.message.toString());
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
              (route) => false);
        } else {
          isLoading = false;
          notifyListeners();
          showToastHelper(response.message.toString());
        }
      } else {
        isLoading = false;
        notifyListeners();
        showToastHelper(response.toString());
      }
    });
  }
}

Future<bool?> showToastHelper(String message) {
  return Fluttertoast.showToast(msg: message);
}
