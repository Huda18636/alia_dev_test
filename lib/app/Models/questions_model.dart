import 'package:alia_dev_test/app/Models/options_model.dart';

class QuestionModel {
    int? id;
    String? question;
    String? answerType;
    List<OptionModel>? options;

    QuestionModel({
        this.id,
        this.question,
        this.answerType,
        this.options = const [],
    });
factory QuestionModel.fromJson(Map<String, dynamic> json) {
   List<OptionModel> optionsTemp = [];
    json['options']?.forEach((item) {
      optionsTemp.add(OptionModel.fromJson(item));
    });
    return QuestionModel(
      id: json['id'],
      question: json['question'],
      answerType: json['answerType'],
     options: optionsTemp

    );
  }
}