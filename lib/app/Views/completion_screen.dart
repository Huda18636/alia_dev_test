import 'package:alia_dev_test/app/App_Helpers/Constants.dart';
import 'package:alia_dev_test/app/App_Helpers/helpers.dart';
import 'package:alia_dev_test/app/Controllers/app_controller.dart';
import 'package:alia_dev_test/app/Views/home.dart';
import 'package:alia_dev_test/app/Views/single_selection.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ReportCompleteScreen extends GetView<AppController> {
  const ReportCompleteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            Image.asset(
                "images/img_finish.png",
                width: 224,
                height: 224,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Self report completed",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 15,
              ),
               ElevatedButton(
                  onPressed: () {
                  //  Get.offNamedUntil(Home, (route) => false);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                    fixedSize: const Size(double.infinity, 48),
                    
                    backgroundColor: getPrimaryColor(), // Button color
                  ),
                  child:
                      Center(child: Text("Go to home")),
                ),

              // Container(
              //   width: double.maxFinite,
              //   height: 144,
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(12),
              //       color: HexColor("AC8E63")),
              //   child: Padding(
              //     padding: const EdgeInsets.only(
              //         top: 20, left: 20, right: 80, bottom: 20),
              //     child: Column(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Text(
              //           "Help your Therapist know how to best support you",
              //           overflow: TextOverflow.visible,
              //           style:
              //               TextStyle(fontSize: 20, color: HexColor("E1D9C5")),
              //         ),
              //         InkWell(
              //             onTap: () {
              //               Get.to(SingleSelection());
              //             },
              //             child: Text(
              //               "Take A Check-in",
              //               style: TextStyle(
              //                   fontSize: 14,
              //                   fontWeight: FontWeight.w600,
              //                   color: HexColor("FFFFFF")),
              //             )),
              //       ],
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
