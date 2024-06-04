class DefaultModel {
  String? body;
  bool? success;

  DefaultModel({this.body,this.success});

  factory DefaultModel.fromJson(Map<String, dynamic> json) {

    return DefaultModel(
      body: json['body'],
      success: json["success"]
    );
  }
}