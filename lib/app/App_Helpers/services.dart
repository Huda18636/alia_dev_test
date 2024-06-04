import 'package:alia_dev_test/app/App_Helpers/Constants.dart';
import 'package:alia_dev_test/app/App_Helpers/api_services_base.dart';
import 'package:alia_dev_test/app/App_Helpers/helpers.dart';
import 'package:alia_dev_test/app/Controllers/app_controller.dart';
import 'package:alia_dev_test/app/Models/base_api_response.dart';
import 'package:alia_dev_test/app/Models/default_model.dart';
import 'package:alia_dev_test/app/Models/login_base_model.dart';
import 'package:alia_dev_test/app/Models/questions_model_base.dart';
import 'package:alia_dev_test/app/Models/refresh_token_model.dart';
import 'package:alia_dev_test/app/Models/refresh_token_model_base.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Services {
   var apiService = APIServicesBase.instance;
  Future<QuestionModelBase> getQuestions() async {
    try {
      var url = Constants.questionsUrl;
      var res = await apiService.getData(url);

      var resp = QuestionModelBase.fromJson(res);
      return resp;
    } catch (err) {
      rethrow;
    }
  }
  Future<BaseApiResponse<LoginBaseModel>> login(
      Map<String, String> userEmail,
      
      BuildContext context) async {
    try {
      var url = Constants.loginUrl;
      var res = await apiService.postData(
        url,
        body: userEmail,
        context: context,
        headers: apiService.getReqHeadersWithoutToken(),
      );

      var resp = BaseApiResponse<LoginBaseModel>.fromJson(res);
      return resp;
    } catch (err) {
      print(err);
      rethrow;
    }
  }
   Future<DefaultModel> postAnswers(
      Map<String, List<dynamic>> body,
      
      BuildContext context) async {
    try {
      var url = Constants.answerUrl;
      var res = await apiService.postData(
        url,
        body: body,
        context: context,
      );

      var resp = DefaultModel.fromJson(res);
      return resp;
    } catch (err) {
      rethrow;
    }
  }
     void refreshToken(
    ) async {

       var refreshToken = await GetStorage().read(Constants.refreshToken);
      Map<String, List<dynamic>> dataPayload = {"refreshToken": refreshToken};
    try {
      Constants.shouldFreeze(true);
      var url = Constants.refreshTokenUrl;
      var res = await apiService.postData(
        url,
        body: dataPayload,
        headers: apiService.getReqHeadersWithoutToken(),
      );

      var resp = BaseApiResponse<RefreshTokenModelBase>.fromJson(res);
      Constants.shouldFreeze(false);
if (resp.success == true) {

  showElegantNotification(Get.context!, "success",
         "Success!", "Token refreshed successfully.");
       final box = GetStorage();

        box.write(Constants.authToken, resp.body!.token!.accessToken);

  
      } else {
        showElegantNotification(Get.context!, "error",
         "Error!", "Unable to refresh token.");
        print(resp);
      }
    } catch (err) {
       Constants.shouldFreeze(false);
      rethrow;
    }
  }
}