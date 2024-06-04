class AnswersModel {
  int? questionId;
  int? selectedOptionId;
  bool? freeformValue;

  AnswersModel({
    this.questionId,
    this.selectedOptionId,
    this.freeformValue,
  });

  // Method to convert the object to JSON
  Map<String, dynamic> toJson() {
    return {
      'questionId': questionId,
      'selectedOptionId': selectedOptionId,
      'freeformValue': freeformValue,
    };
  }
}