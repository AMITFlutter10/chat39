import 'dart:core';
class UserModel{
  String? name;
  String? id;
  String? photo;
  String? email;
  String? password;

  UserModel({this.name, this.id ,
    this.photo, this.email,
    this.password
  });
  static UserModel fromJson( Map <String, dynamic> json){
    UserModel user =UserModel(
      id: json["id"],
      name:json["name"],
      email: json["email"],
      photo: json["photo"],
      password: json["password"],
    );
    return user;
  }

  Map<String, dynamic>toJson(){
    Map<String, dynamic>map={
      "id":id,
      "name":name,
      "email":email,
      "photo":photo,
      "password":password,
    };
    return map;
  }

}