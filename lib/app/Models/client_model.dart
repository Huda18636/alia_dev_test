class ClientModel {
  bool? detailsAdded;
  bool? onboardingDone;
  String? email;

  int? id;

  ClientModel({
    this.detailsAdded,
    this.onboardingDone,
    this.email,
    this.id
  });

  factory ClientModel.fromJson(Map<String, dynamic> json) {
    return ClientModel(
      detailsAdded: json['detailsAdded'],
      onboardingDone: json['onboardingDone'],
      email: json['email'],
      id: json['id'],


    );
  }
}
