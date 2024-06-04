import 'package:alia_dev_test/app/Controllers/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppController>(
      () => AppController(),
    );
  }
}