class StatusModel {
  Statis? statis;
  Today? today;
  Result? result;

  StatusModel({this.statis, this.today, this.result});

  StatusModel.fromJson(Map<String, dynamic> json) {
    statis = json['statis'] != null ? Statis.fromJson(json['statis']) : null;
    today = json['today'] != null ? Today.fromJson(json['today']) : null;
    result = json['result'] != null ? Result.fromJson(json['result']) : null;
  }
}

class Statis {
  String? steps;
  String? result;

  Statis({this.steps, this.result});

  Statis.fromJson(Map<String, dynamic> json) {
    steps = json['steps'];
    result = json['result'];
  }
}

class Today {
  String? date;
  String? duration;
  String? todo;
  String? done;

  Today({this.date, this.duration, this.todo, this.done});

  Today.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    duration = json['duration'];
    todo = json['todo'];
    done = json['done'];
  }
}

class Result {
  String? steps;
  String? coins;

  Result({this.steps, this.coins});

  Result.fromJson(Map<String, dynamic> json) {
    steps = json['steps'];
    coins = json['coins'];
  }
}
