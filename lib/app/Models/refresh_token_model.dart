
class RefreshTokenModel {
  String? accessToken;
  String? id;
 

  RefreshTokenModel({
    this.accessToken,
    this.id,

  });

  factory RefreshTokenModel.fromJson(Map<String, dynamic> json) {
    return RefreshTokenModel(
      accessToken: json['accessToken'],
      id: json['id'],
   

    );
  }
}
