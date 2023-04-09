class HistoryModel {
  List<Data>? data;

  HistoryModel({this.data});

  HistoryModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

}

class Data {
  String? date;
  String? pt;
  String? km;
  String? kcol;
  String? steps;

  Data({this.date, this.pt, this.km, this.kcol, this.steps});

  Data.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    pt = json['pt'];
    km = json['km'];
    kcol = json['kcol'];
    steps = json['steps'];
  }
}
