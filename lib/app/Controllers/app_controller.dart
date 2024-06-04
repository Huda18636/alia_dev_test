import 'package:alia_dev_test/app/App_Helpers/Constants.dart';
import 'package:alia_dev_test/app/App_Helpers/helpers.dart';
import 'package:alia_dev_test/app/App_Helpers/services.dart';
import 'package:alia_dev_test/app/Models/answers_model.dart';
import 'package:alia_dev_test/app/Models/options_model.dart';
import 'package:alia_dev_test/app/Models/questions_model.dart';
import 'package:alia_dev_test/app/Models/slider_model.dart';
import 'package:alia_dev_test/app/Views/completion_screen.dart';
import 'package:alia_dev_test/app/Views/single_selection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';

class AppController extends GetxController {

  var sliderValue = 0.0.obs;
  var appkey = '';
  List<QuestionModel> questionsList = [];
  List<OptionModel> sliderItems = [];
  List<OptionModel> scaleItems = [];

  var currentSliderIndex = 0.obs;
  @override
  void onInit() async {
    super.onInit();
  }
  

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  void signInUser(BuildContext context) async {
    Map<String, String> dataPayload = {
      "email": "dev@alliauk.com",
      "password": "12345678"
    };
    try {
      Constants.shouldFreeze(true);
      var resp = await Services().login(dataPayload, context);
      Constants.shouldFreeze(false);

      debugPrint('Menu ${resp.body!}');

      if (resp.success == true) {
        showElegantNotification(context, "success",
         "Success!", "Logged in successfully.");

        final box = GetStorage();

        box.write(Constants.authToken, resp.body!.accessToken);
        box.write(Constants.userId, resp.body!.client!.id);
        box.write(Constants.refreshToken, resp.body!.refreshToken);
        // DateTime expiry;
        // expiry = DateTime.now();
        // box.write(Constants.expiryTime,expiry);



        getQuestions();
        //Get.to(SingleSelection());
      } else {
        print(resp);
      }
    } catch (err) {
      Constants.shouldFreeze(false);

      print(err);
      if (!context.mounted) return;

showElegantNotification(context, "error", "Error", 'Could not sign in');
    }
  }

  void getQuestions() async {
    try {
      Constants.shouldFreeze(true);
      var resp = await Services().getQuestions();
      Constants.shouldFreeze(false);

      debugPrint('Menu ${resp.questions!}');

      if (resp.success == true) {
       showElegantNotification(Get.context!, "success",
        "Success!", "Data recieved successfully");
        questionsList = resp.questions!;
        sliderItems = resp
                .questions![questionsList.indexWhere(
                    (element) => element.answerType! == "single_choice")]
                .options ??
            [];
        scaleItems = resp
                .questions![questionsList.indexWhere(
                    (element) => element.answerType! == "likert_scale")]
                .options ??
            [];
        Get.to(SingleSelection());
      } else {
        print(resp);
      }
    } catch (err) {
      Constants.shouldFreeze(false);

      print(err);

   showElegantNotification(Get.context!, "error", "Error", 'Could not get questions.');
    }
  }

  void postAnswers(BuildContext context) async {
    print("posting");
    int scaleIndex = (sliderValue.value)~/10.0;
     scaleIndex = scaleIndex - 1;
    print("ind $scaleIndex");
    var answersList = [
      AnswersModel(
          questionId: sliderItems[currentSliderIndex.value].questionId,
          selectedOptionId: sliderItems[currentSliderIndex.value].id,
          freeformValue: null),
      AnswersModel(
          questionId: scaleItems[scaleIndex].questionId,
          selectedOptionId: sliderItems[scaleIndex].id,
          freeformValue: null)
    ];
    Map<String, List<dynamic>> dataPayload = {"answers": answersList};
    try {
      Constants.shouldFreeze(true);
      var resp = await Services().postAnswers(dataPayload, context);
      Constants.shouldFreeze(false);

      debugPrint('Menu ${resp.body!}');

      if (resp.success == true) {
      showElegantNotification(context, "success",
         "Success!", "Self report submitted successfully.");

  
        Get.to(ReportCompleteScreen());
      } else {
        print(resp);
      }
    } catch (err) {
      Constants.shouldFreeze(false);

      print(err);
      if (!context.mounted) return;

   showElegantNotification(context, "error", "Error", 'Could not post answers.');
    }
  }
  
}
