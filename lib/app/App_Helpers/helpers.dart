import 'package:flutter/material.dart';
import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/arrays.dart';
import 'package:get/get.dart';
class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toString().toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }
    return int.parse(hexColor, radix: 16);
  }
}

void showElegantNotification(
    BuildContext context, String type, String title, String description) {
  if (type == "success") {
    ElegantNotification.success(
      width: Get.size.width - 30,
      position: Alignment.topCenter,
    
    
      animation: AnimationType.fromTop,
      title: Text(title),
      description: Text(description,overflow: TextOverflow.visible,),
      onDismiss: () {},
    ).show(context);
  } else if (type == "info") {
    ElegantNotification.info(
       width: Get.size.width - 30,
 position: Alignment.topCenter,
      animation: AnimationType.fromTop,
      title:
      Text(title),
      description: Text(description,overflow: TextOverflow.visible,),
      onDismiss: () {},
    ).show(context);
  } else if (type == "error") {
    ElegantNotification.error(
       width: Get.size.width - 30,
position: Alignment.topCenter,

      animation: AnimationType.fromTop,
      title: Text(title),
      description: 
      Text(description,overflow: TextOverflow.visible,),
      onDismiss: () {},
    ).show(context);
  }
    }
