class CategoriesResponse {
  CategoriesResponse({
      this.status, 
      this.categories,});

  CategoriesResponse.fromJson(dynamic json) {
    status = json['status'];
    if (json['categories'] != null) {
      categories = [];
      json['categories'].forEach((v) {
        categories?.add(CategoryData.fromJson(v));
      });
    }
  }
  int? status;
  List<CategoryData>? categories;
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (categories != null) {
      map['categories'] = categories?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class CategoryData {
  CategoryData({
      this.id, 
      this.name, 
      this.v,});

  CategoryData.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    v = json['__v'];
  }
  String? id;
  String? name;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['__v'] = v;
    return map;
  }

}