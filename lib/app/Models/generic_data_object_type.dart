import 'package:alia_dev_test/app/Models/default_model.dart';
import 'package:alia_dev_test/app/Models/login_base_model.dart';
import 'package:alia_dev_test/app/Models/questions_model_base.dart';
import 'package:alia_dev_test/app/Models/refresh_token_model.dart';
import 'package:alia_dev_test/app/Models/refresh_token_model_base.dart';

class GenericDataObjectType {
  T getGenericObjectType<T>(Map<String, dynamic> jsonData) {
    switch (T) {
      case LoginBaseModel:
        return LoginBaseModel.fromJson(jsonData) as T;

      case RefreshTokenModelBase:
        return RefreshTokenModelBase.fromJson(jsonData) as T;
    }
    return DefaultModel.fromJson(jsonData) as T;
  }
}
