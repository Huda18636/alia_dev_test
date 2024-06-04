import 'package:alia_dev_test/app/App_Helpers/helpers.dart';
import 'package:alia_dev_test/app/Models/options_model.dart';
import 'package:alia_dev_test/app/Models/slider_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class EmotionSlider extends StatelessWidget {
  const EmotionSlider({required this.sliderItem, super.key});
  final OptionModel sliderItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 60),
      child: Container
      (constraints: BoxConstraints(minHeight: 291),
      width: 266,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
                  BoxShadow(
                    color: Color(0x2A36472E), // #2A36472E color with opacity
                    offset: Offset(0, 24), // Horizontal and vertical offset
                    blurRadius: 48, // Blur radius
                    spreadRadius: -12, // Spread radius
                  ),
                ],
      ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              Icon(Icons.emoji_emotions,size: 100),
              SizedBox(height: 30,),
              Text(sliderItem.option ?? "N\A",style: TextStyle(fontSize: 36,color: HexColor("AC8E63"),fontWeight: FontWeight.w600),)
                
            ]),
          ),
        ),
      ),
    );
  }
}