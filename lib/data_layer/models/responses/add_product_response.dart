class AddProductResponse {
  AddProductResponse({
      this.status, 
      this.massage,});

  AddProductResponse.fromJson(dynamic json) {
    status = json['status'];
    massage = json['massage'];
  }
  String? status;
  String? massage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['massage'] = massage;
    return map;
  }

}