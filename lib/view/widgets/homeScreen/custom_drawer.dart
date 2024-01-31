import 'package:ecommercecourse/controller/auth/logincontroller.dart';
import 'package:ecommercecourse/controller/home_controller.dart';
import 'package:ecommercecourse/view/widgets/homeScreen/home/custom_card_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../../../core/constant/routes.dart';

class CustomDrawer extends GetView<HomeControllerImp> {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    LoginControllerImp controllerImp = LoginControllerImp();
    return Drawer(
      shadowColor: AppColor.primaryColor,
      backgroundColor: AppColor.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 50,
          ),
          CustomCardHome(title: controller.username!, body: controller.phone!),
          const SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () {
              Get.toNamed(AppRoutes.languageApp);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              height: 40,
              decoration: BoxDecoration(
                  color: AppColor.primaryColor,
                  borderRadius: BorderRadius.circular(30)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "1".tr,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: AppColor.white),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: const Icon(
                      Icons.language,
                      color: AppColor.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    controllerImp.logOut();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: Text("56".tr),
                ),
                const SizedBox(
                  width: 30,
                ),
                IconButton(
                    onPressed: () {
                      controllerImp.logOutDefault();
                    },
                    icon: const Icon(Icons.logout),
                    color: AppColor.primaryColor),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
