import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/view/screens/address/address_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../controller/auth/login_controller.dart';
import '../../core/constant/imageassets.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginControllerImp controller = Get.put(LoginControllerImp());
    return ListView(
      children: [
        Stack(clipBehavior: Clip.none, alignment: Alignment.center, children: [
          Container(height: Get.width / 3, color: AppColor.primaryColor),
          Positioned(
              top: Get.width / 3.9,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100)),
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: AppColor.backGroundColor,
                  child: Lottie.asset(AppImageAssets.profile, fit: BoxFit.fill),
                ),
              )),
        ]),
        const SizedBox(height: 100),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Card(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              ListTile(
                onTap: () {},
                trailing: Switch(onChanged: (val) {}, value: true),
                title: Text("78".tr),
              ),
              ListTile(
                onTap: () {
                  Get.to(const AddressView(),
                      transition: Transition.fade,
                      duration: const Duration(seconds: 1));
                },
                trailing: const Icon(
                  Icons.location_on_outlined,
                  color: AppColor.primaryColor,
                ),
                title: Text("68".tr),
              ),
              ListTile(
                onTap: () {},
                trailing: const Icon(
                  Icons.help_outline_rounded,
                  color: AppColor.primaryColor,
                ),
                title: Text("67".tr),
              ),
              ListTile(
                onTap: () async {
                  await launchUrl(Uri.parse("tel:0988550610"));
                  // await launchUrl(Uri.parse("https://wa.me/+963988550610"));
                },
                trailing: const Icon(
                  Icons.phone_callback_outlined,
                  color: AppColor.primaryColor,
                ),
                title: Text("66".tr),
              ),
              ListTile(
                onTap: () {
                  controller.logOut();
                },
                title: Text("56".tr),
                trailing: const Icon(
                  Icons.exit_to_app,
                  color: AppColor.primaryColor,
                ),
              ),
            ]),
          ),
        )
      ],
    );
  }
}
