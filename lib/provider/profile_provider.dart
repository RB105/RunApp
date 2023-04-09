import 'package:flutter/material.dart';
import 'package:runningapp/data/model/profile_model.dart';
import 'package:runningapp/data/service/home_get_service.dart';

class ProfileProvider extends ChangeNotifier {
  ProfileProvider() {
    getProfile();
  }

  HomeGetServices getServices = HomeGetServices();

  bool isLoading = false;
  ProfileModel? data;
  String error = "";

  Future<void> getProfile() async {
    isLoading = true;
    notifyListeners();
    await getServices.getProfile().then((dynamic response) {
      if (response is ProfileModel) {
        data = response;
        isLoading = false;
        notifyListeners();
      } else {
        error = response;
        isLoading = false;
        notifyListeners();
      }
    });
  }
}
