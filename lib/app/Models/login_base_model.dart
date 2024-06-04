import 'package:alia_dev_test/app/Models/client_model.dart';

class LoginBaseModel {
  String? accessToken;
  String? refreshToken;
  String? chatToken;
  ClientModel? client;


  LoginBaseModel({
    this.accessToken,
    this.refreshToken,
    this.chatToken,
    this.client,
 
  });

  factory LoginBaseModel.fromJson(Map<String, dynamic> json) {
    return LoginBaseModel(
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
      chatToken: json['chatToken'],
     client: ClientModel.fromJson(json['client'])

    );
  }
}
