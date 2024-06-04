
import 'package:alia_dev_test/app/Models/generic_data_object_type.dart';

class BaseApiResponse<T> {
  bool? success;
  T? body;

  BaseApiResponse({
    this.success,
    this.body
  });

  factory BaseApiResponse.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> handleNullResponse = {"": ""};

    T data = GenericDataObjectType()
        .getGenericObjectType<T>(json['body'] ?? handleNullResponse);

    return BaseApiResponse<T>(
      success: json['success'],
      body: data,
    );
  }
}
