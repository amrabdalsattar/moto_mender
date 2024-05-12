class AddingCategoriesResponse {
  AddingCategoriesResponse({
      this.status, 
      this.category,});

  AddingCategoriesResponse.fromJson(dynamic json) {
    status = json['status'];
    category = json['category'] != null ? CategoryModel.fromJson(json['category']) : null;
  }
  int? status;
  CategoryModel? category;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (category != null) {
      map['category'] = category?.toJson();
    }
    return map;
  }

}

class CategoryModel {
  CategoryModel({
      this.name, 
      this.id, 
      this.v,});

  CategoryModel.fromJson(dynamic json) {
    name = json['name'];
    id = json['_id'];
    v = json['__v'];
  }
  String? name;
  String? id;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['_id'] = id;
    map['__v'] = v;
    return map;
  }

}