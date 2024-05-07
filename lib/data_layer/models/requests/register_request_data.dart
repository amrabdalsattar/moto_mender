class RegisterRequestData {
  RegisterRequestData({
      this.name, 
      this.email, 
      this.password, 
      this.phone, 
      this.address,});

  String? name;
  String? email;
  String? password;
  String? phone;
  String? address;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['password'] = password;
    map['phone'] = phone;
    map['address'] = address;
    return map;
  }

}