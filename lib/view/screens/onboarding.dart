import 'package:ecommercecourse/controller/onboarding_controller.dart';
import 'package:ecommercecourse/view/widgets/onBoarding/custombutton.dart';
import 'package:flutter/material.dart';
import '../widgets/onBoarding/dotcontroller.dart';
import '../widgets/onBoarding/customslider.dart';
import 'package:get/get.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Column(
        children: [
          const Expanded(
            flex: 3,
            child: CustomSliderOnBoarding(),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: const [
                CustomDotControllerOnBoarding(),
                Spacer(flex: 2),
                CustomButtonOnBoarding(),
              ],
            ),
          )
        ],
      )),
    );
  }
}
