class UrModels {
  final String? name;
  final String? email;
  final String? id;

  UrModels({this.name, this.email, this.id});
  // UrModels fromJson(){}
  Map<String, dynamic> toJson() {
    return {'name': name, 'email': email, 'id': id};
  }
}
