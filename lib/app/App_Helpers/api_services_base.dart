import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:alia_dev_test/app/App_Helpers/Constants.dart';
import 'package:alia_dev_test/app/App_Helpers/services.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';


class APIServicesBase {
  APIServicesBase._();

  /// the one and only instance of this singleton
  static final instance = APIServicesBase._();
  final pref = GetStorage();

  Future<Map<String, String>> getReqHeaders(String jsonData) async {
    
    var expiry = await await GetStorage().read(Constants.expiryTime);
    
    if(expiry != null && DateTime.now().isAfter(expiry)){
      try{
        showDisappearingMessage(Get.context!, "Access token expired, refreshing token now");
        //Services().refreshToken();

        
      }
      catch(err){
        print(err);
      }
    }
    
   var token = await await GetStorage().read(Constants.authToken);
    
 


    print("length ${utf8.encode(jsonData).length.toString()}");

    return {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
      'Content-Length': utf8.encode(jsonData).length.toString(),

    };

  }

  Future<Map<String, String>> getReqHeaders2() async {
    var token = await await GetStorage().read(Constants.authToken);

    return {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
     // 'Content-Length': utf8.encode(jsonData).length.toString(),

    };
  }

  Map<String, String> getReqHeadersWithoutToken() {
    return {
      'Content-type': 'application/json',
      'Accept': 'application/json',

    };
  }

  Future<Map<String, dynamic>> postData(String url,
      {Map<String, String>? headers,
      Map<String, dynamic>? body,
      BuildContext? context}) async {
 

    try {
      Uri uriObj = Uri.parse(url);
      Map<String, String> reqHeaders = await getReqHeaders(json.encode(body));


      http.Response response;

      response = await http.post(
        uriObj,
        body: jsonEncode(body),
        headers: headers ?? reqHeaders,
      );
   
      debugPrint('Encoded Response ${response}');

      var decoded = jsonDecode(response.body);
      print("json $decoded");
    

      return decoded;
    } catch (err) {
     print(err);
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getData(String url,
      {Map<String, String>? headers}) async {
    try {
      Uri uriObj = Uri.parse(url);
      Map<String, String> reqHeaders = await getReqHeaders2();

      http.Response response;

      response = await http.get(
        uriObj,
        headers: reqHeaders,
      );

      var decoded = jsonDecode(response.body);

      return decoded;
    } catch (err) {
      rethrow;
    }
  }

 
  void showDisappearingMessage(BuildContext context, String message) {

    Flushbar(
      isDismissible: false,
      titleText: Icon(Icons.info,color: Theme.of(context).primaryColor,),

      flushbarPosition: FlushbarPosition.TOP,
      blockBackgroundInteraction: true
      ,
      // message: message,
      messageSize: 300,
      messageText: Center(child: Text(message,style: const TextStyle(color: Colors.black,),)),
      margin:  EdgeInsets.only(top:  MediaQuery.of(context).size.height/2,left: 30, right: 30) ,
      duration: const Duration(seconds: 3),
      flushbarStyle: FlushbarStyle.FLOATING,
      backgroundColor: Colors.white,
      // borderColor: Colors.black,
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      boxShadows: const [
        BoxShadow(
          color: Colors.grey,
          offset: Offset(0.0, 2.0),
          blurRadius: 4.0,
        ),
      ],


      onStatusChanged: (status) {
        if (status == FlushbarStatus.DISMISSED) {
         Services().refreshToken();
        }
      },
    ).show(context);
  }

  
}
