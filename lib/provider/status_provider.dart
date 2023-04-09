import 'package:flutter/material.dart';
import 'package:runningapp/data/model/status_model.dart';
import 'package:runningapp/data/service/home_get_service.dart';

class StatusProvider extends ChangeNotifier {
  StatusProvider(){
    getStatus();
  }


  HomeGetServices getServices = HomeGetServices();

  bool isLoading = false;
  StatusModel? data;
  String error = "";

  Future<void> getStatus() async {
    isLoading = true;
    notifyListeners();
    await getServices.getStatus().then((dynamic response) {
      if (response is StatusModel) {
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
