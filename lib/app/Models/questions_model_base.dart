import 'package:alia_dev_test/app/Models/options_model.dart';
import 'package:alia_dev_test/app/Models/questions_model.dart';

class QuestionModelBase {
   bool?success;
    List<QuestionModel>? questions;

    QuestionModelBase({
      this.success,
        this.questions = const [],
    });
factory QuestionModelBase.fromJson(Map<String, dynamic> json) {
   List<QuestionModel> questionsTemp = [];
    json["body"].forEach((item) {
      questionsTemp.add(QuestionModel.fromJson(item));
    });
    return QuestionModelBase(
      questions: questionsTemp,
      success:json["success"],
    

    );
  }
}