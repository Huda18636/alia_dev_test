class OptionModel {
    int? id;
    String? option;
    bool? isFreeForm;
    int? questionId;

    OptionModel({
        this.id,
        this.option,
        this.isFreeForm,
        this.questionId,
    });
factory OptionModel.fromJson(Map<String, dynamic> json) {
   
    return OptionModel(
      id: json['id'],
      option: json['option'],
      isFreeForm: json['isFreeForm'],
     questionId: json["questionId"]

    );
  }
}
