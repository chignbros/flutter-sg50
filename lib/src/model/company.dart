class CompanyModel {
  int id;
  String phone;
  String descriptionKh;
  String mobile;
  String address;
  String addressKh;
  String updateAt;
  String name;
  String imageUrl;
  String nameKh;
  String createAt;
  String description;
  String email;
  String website;

  CompanyModel(
      {this.id,
      this.phone,
      this.descriptionKh,
      this.mobile,
      this.address,
      this.addressKh,
      this.updateAt,
      this.name,
      this.imageUrl,
      this.nameKh,
      this.createAt,
      this.description,
      this.email,
      this.website});

  CompanyModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    phone = json['phone'];
    descriptionKh = json['descriptionKh'];
    mobile = json['mobile'];
    address = json['address'];
    addressKh = json['addressKh'];
    updateAt = json['updateAt'];
    name = json['name'];
    imageUrl = json['imageUrl'];
    nameKh = json['nameKh'];
    createAt = json['createAt'];
    description = json['description'];
    email = json['email'];
    website = json['website'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['phone'] = this.phone;
    data['descriptionKh'] = this.descriptionKh;
    data['mobile'] = this.mobile;
    data['address'] = this.address;
    data['addressKh'] = this.addressKh;
    data['updateAt'] = this.updateAt;
    data['name'] = this.name;
    data['imageUrl'] = this.imageUrl;
    data['nameKh'] = this.nameKh;
    data['createAt'] = this.createAt;
    data['description'] = this.description;
    data['email'] = this.email;
    data['website'] = this.website;
    return data;
  }
}
