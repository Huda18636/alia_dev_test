import 'package:alia_dev_test/app/App_Helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Color getPrimaryColor(){
  return HexColor("2E959E");
}
class Constants{
  //UAT BASE URL
  static String baseURL = 'https://api-dev.allia.health';

  //Relative URLS
  static String loginUrl = '$baseURL/api/client/auth/login';
  static String questionsUrl = '$baseURL/api/client/self-report/question';
  static String answerUrl = '$baseURL/api/client/self-report/answer';
  static String refreshTokenUrl = '$baseURL/api/client/auth/refresh-token';




  // Shared-preference

  static String authToken = 'access_token';
  static String userId = 'user_id';
  static String refreshToken = 'refresh_token';
  static String expiryTime = 'expiry_time';


  static RxBool shouldFreeze=false.obs;
}