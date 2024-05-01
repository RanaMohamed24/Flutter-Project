class UserModel {
  String? id;
  String? name;
  String? address;

  UserModel({this.id, this.name, this.address});

  UserModel.fromJson(Map map) {
    id = map['id'].toString();
    name = map['name'];
    address = map['address'];
  }
}
