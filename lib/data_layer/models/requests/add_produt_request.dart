class AddProductRequest {
  AddProductRequest({
      this.name, 
      this.description, 
      this.price, 
      this.category, 
      this.imagePath,});

  String? name;
  String? description;
  double? price;
  String? category;
  String? imagePath;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['description'] = description;
    map['price'] = price;
    map['category'] = category;
    map['imagePath'] = imagePath;
    return map;
  }

}