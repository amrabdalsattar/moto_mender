class AuthResponse {
  AuthResponse({
      this.message, 
      this.user, 
      this.token,});

  AuthResponse.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }
  String? message;
  User? user;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }

}

class User {
  User({
      this.id, 
      this.name, 
      this.email, 
      this.phone, 
      this.address, 
      this.role, 
      this.isBlocked, 
      this.profileImage, 
      this.password, 
      this.v,});

  User.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    role = json['role'];
    isBlocked = json['isBlocked'];
    profileImage = json['profileImage'];
    password = json['password'];
    v = json['__v'];
  }
  String? id;
  String? name;
  String? email;
  String? phone;
  String? address;
  String? role;
  bool? isBlocked;
  String? profileImage;
  String? password;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['phone'] = phone;
    map['address'] = address;
    map['role'] = role;
    map['isBlocked'] = isBlocked;
    map['profileImage'] = profileImage;
    map['password'] = password;
    map['__v'] = v;
    return map;
  }

}