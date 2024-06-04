import 'package:alia_dev_test/app/App_Helpers/helpers.dart';
import 'package:alia_dev_test/app/Controllers/app_controller.dart';
import 'package:alia_dev_test/app/Models/slider_model.dart';
import 'package:alia_dev_test/app/Views/likert_scale.dart';
import 'package:alia_dev_test/app/Views/slider_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingleSelection extends GetView<AppController> {
  const SingleSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 100),
              child:  Column(
                children: [
                  Text(
                    controller.questionsList[controller.questionsList.indexWhere((element) => element.answerType! == "single_choice")].question ?? "How are you feeling code?",
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                  // SizedBox(height: ),
                  // Obx(() =>
                  //   Text(
                  //     "Select the number that best represents your ${controller.sliderItems[controller.currentSliderIndex.value].description} level.",
                  //     style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  //     textAlign: TextAlign.center,
                  //   ),
                  // ),
                  // SizedBox(height: 80),
                  Expanded(
                    child: Center(
                      child: CarouselSlider(
                        options: CarouselOptions(
                          viewportFraction: 0.7, // Set the viewport fraction to less than 1.0
                          height: 320 ,
                          autoPlay: false,
                          enlargeCenterPage: true,
                          onPageChanged: (index, reason) {
                            controller.currentSliderIndex.value = index;
                          },
                        ),
                         
                        items: controller.sliderItems.map((item) => 
                        EmotionSlider(sliderItem: item)).toList(),
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: Get.size.height * 0.2, // Adjust the margin from the bottom
            left: 0,
            right: 0,
            child: Center(
              child: SizedBox(
                height: 80,
                width: 80,
                child: ElevatedButton(
                  onPressed: () {
                    print('Elevated Button Pressed');
                    Get.to(LikertScaleScreen());
                  },
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    backgroundColor: HexColor("2E959E"), // Button color
                  ),
                  child: Center(child: Icon(Icons.arrow_forward_sharp, size: 50)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
