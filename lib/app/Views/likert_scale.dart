import 'package:alia_dev_test/app/App_Helpers/Constants.dart';
import 'package:alia_dev_test/app/App_Helpers/helpers.dart';
import 'package:alia_dev_test/app/Controllers/app_controller.dart';
import 'package:alia_dev_test/app/Views/completion_screen.dart';
import 'package:alia_dev_test/app/Views/custom_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class LikertScaleScreen extends GetView<AppController> {
  const LikertScaleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> WillPopScope(
        onWillPop: ()async{
         return !Constants.shouldFreeze.value;
        },
        child: Stack(
          children: [
            Scaffold(
              appBar: AppBar(backgroundColor: Theme.of(context).scaffoldBackgroundColor,elevation: 0,leading: InkWell(child: Icon(Icons.arrow_back,color: Colors.black),onTap: (){Get.back();},),),
              extendBodyBehindAppBar: true,
              body: Stack(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 100),
                      child: Column(
                        children: [
                         const Text(
                            "You're feeling",
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 20),
                          Text(
                            controller.sliderItems[controller.currentSliderIndex.value]
                                    .option ??
                                "N\A",
                            style: TextStyle(
                                fontSize: 36,
                                color: HexColor("AC8E63"),
                                fontWeight: FontWeight.w600),
                          ),
                         const SizedBox(height: 30),
                          
                            Text(
                              controller.questionsList[1].question!,
                              style:
                                 const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                              textAlign: TextAlign.center,
                            ),
                          
                          SizedBox(height: 30),
                          Obx(()=>
                            SizedBox(
                              height: 300,
                              width: 86,
                              
                              child: Stack(
                                children: [ 
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 50),
                                    child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                      Container(height: 3,width: 86,decoration: BoxDecoration(color: 
                                      controller.sliderValue.value >= 90.0 ? 
                                      getPrimaryColor():  HexColor("F1EDE3")),),
                                      Container(height: 3,width: 86,decoration: BoxDecoration(color: controller.sliderValue.value >= 70.0 ? 
                                      getPrimaryColor():  HexColor("F1EDE3")),),
                                      Container(height: 3,width: 86,decoration: BoxDecoration(color: controller.sliderValue.value >= 50.0 ? 
                                      getPrimaryColor():  HexColor("F1EDE3")),),
                                      Container(height: 3,width: 86,decoration: BoxDecoration(color: controller.sliderValue.value >= 30.0 ? 
                                      getPrimaryColor():  HexColor("F1EDE3")),),
                                      Container(height: 3,width: 86,decoration: BoxDecoration(color: controller.sliderValue.value >= 10.0 ? 
                                      getPrimaryColor():  HexColor("F1EDE3")),),
                                  
                                    ],),
                                  ),
                                  Center(
                                    child: Container(
                                      color: Theme.of(context).scaffoldBackgroundColor,
                                      
                                      width: 28,
                                      child: Center(
                                        child: CustomVerticalSlider(
                                                min: 0,
                                                max: 100,
                                                value: controller.sliderValue.value,
                                                onChanged: (value) {
                                                  controller.sliderValue.value = value;
                                                  print(value);
                                                  print("option ${(controller.sliderValue.value).toInt()/10}");
                                                },
                                              ),
                                      ),
                                    ),
                                  ),]
                              ),
                            ),
                          ),
                         const SizedBox(height: 50),
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
                            controller.postAnswers(context);
                           // Get.to(ReportCompleteScreen());
                          },
                          style: ElevatedButton.styleFrom(
                            shape: CircleBorder(),
                            backgroundColor: HexColor("2E959E"), // Button color
                          ),
                          child:
                             const Center(child: Icon(Icons.arrow_forward_sharp, size: 50)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
              if (Constants.shouldFreeze.value)
                
            
                     Stack(
                       children: [
                         ModalBarrier(
                          
                           color: Colors.black.withOpacity(0.3), // Adjust the opacity as needed
                           dismissible: false, // Set to true if you want to allow taps on the barrier
                         ),
                            Center(child: CircularProgressIndicator(color: getPrimaryColor(),),),
        
                        
                       ],
                     ),
          ],
        ),
      ),
    );
  }
}
