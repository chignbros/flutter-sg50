class IllModel {
  int id;
  bool isActive;
  String updateAt;
  String name;
  String nameKh;
  String createAt;
  String description;

  IllModel(
      {this.id,
      this.isActive,
      this.updateAt,
      this.name,
      this.nameKh,
      this.createAt,
      this.description});

  IllModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isActive = json['isActive'];
    updateAt = json['updateAt'];
    name = json['name'];
    nameKh = json['nameKh'];
    createAt = json['createAt'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['isActive'] = this.isActive;
    data['updateAt'] = this.updateAt;
    data['name'] = this.name;
    data['nameKh'] = this.nameKh;
    data['createAt'] = this.createAt;
    data['description'] = this.description;
    return data;
  }
}