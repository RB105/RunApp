class ProfileModel {
  String? img;
  String? name;

  ProfileModel({this.img, this.name});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    img = json['img'];
    name = json['name'];
  }
}
