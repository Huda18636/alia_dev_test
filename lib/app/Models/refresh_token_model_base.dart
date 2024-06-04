
import 'package:alia_dev_test/app/Models/refresh_token_model.dart';

class RefreshTokenModelBase {
  RefreshTokenModel? token;
 

  RefreshTokenModelBase({
   this.token
  });

  factory RefreshTokenModelBase.fromJson(Map<String, dynamic> json) {
    return RefreshTokenModelBase(
      token: json['token'],
   

    );
  }
}
