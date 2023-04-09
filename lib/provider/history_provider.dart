import 'package:flutter/material.dart';
import 'package:runningapp/data/model/history_model.dart';
import 'package:runningapp/data/service/home_get_service.dart';

class HistoryProvider extends ChangeNotifier {
  HistoryProvider() {
    getHistory();
  }

  HomeGetServices getServices = HomeGetServices();

  bool isLoading = false;
  HistoryModel? data;
  String error = "";

  Future<void> getHistory() async {
    isLoading = true;
    notifyListeners();
    await getServices.getHistory().then((dynamic response) {
      if (response is HistoryModel) {
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
