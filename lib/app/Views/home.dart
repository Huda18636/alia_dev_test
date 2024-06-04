import 'package:alia_dev_test/app/App_Helpers/Constants.dart';
import 'package:alia_dev_test/app/App_Helpers/helpers.dart';
import 'package:alia_dev_test/app/Controllers/app_controller.dart';
import 'package:alia_dev_test/app/Views/single_selection.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';


class Home extends GetView<AppController>  {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> WillPopScope(
        onWillPop: () async{
          return !Constants.shouldFreeze.value;
        },
        child: Stack(
          children: [
            Scaffold(
              body: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Hi David, How are you?",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600),),
                     const SizedBox(height: 15,),
                      Container(
                        width: double.maxFinite,
                        height: 144,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
                        color: HexColor("AC8E63")),
          
                        child: Padding(
                        
                        padding: const EdgeInsets.only(top: 20,left: 20,right: 80,bottom: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          Text("Help your Therapist know how to best support you",overflow: TextOverflow.visible,style: TextStyle(fontSize: 20,color: HexColor("E1D9C5")),),
                
                          InkWell
                          (onTap: (){
                            controller.signInUser(context);
                          //  Get.to(SingleSelection());
                          },
                            child: Text("Take A Check-in",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: HexColor("FFFFFF")),)),
                      
                      
                          ],
                        ),
                      ),)
                
                
                    ],
                  ),
                ),
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