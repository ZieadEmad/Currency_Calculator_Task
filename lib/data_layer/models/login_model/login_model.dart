class LoginModel {
  late final bool success;
  late final String message;
  Data? data;
  LoginModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  late final int id;
  late final String name;
  late final String mobile;
  late final String email;
  late final  String image;
  late final  String token;
  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    mobile = json['mobile'];
    email = json['email'];
    image = '${json['image']}';
    token = json['token'];
  }
}