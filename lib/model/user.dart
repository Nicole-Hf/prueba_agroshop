class UserModel {
  final String id;
  final String name;

  UserModel(this.id, this.name);

  UserModel.fromJson(Map json)
      : id = json['id'],
        name = json['name'];

  Map toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}