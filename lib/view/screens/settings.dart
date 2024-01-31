import 'package:ecommercecourse/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/auth/logincontroller.dart';
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
                  radius: 40,
                  backgroundColor: Colors.grey[100],
                  backgroundImage: const AssetImage(AppImageAssets.avatar),
                ),
              )),
        ]),
        const SizedBox(height: 100),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Card(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              ListTile(
                // onTap: () {},
                trailing: Switch(onChanged: (val) {}, value: true),
                title: const Text("Disable Notificatios"),
              ),
              ListTile(
                onTap: () {},
                trailing: const Icon(Icons.location_on_outlined),
                title: Text("68".tr),
              ),
              ListTile(
                onTap: () {},
                trailing: const Icon(Icons.help_outline_rounded),
                title: Text("67".tr),
              ),
              ListTile(
                onTap: () {},
                trailing: const Icon(Icons.phone_callback_outlined),
                title: Text("66".tr),
              ),
              ListTile(
                onTap: () {
                  controller.logOut();
                },
                title: Text("56".tr),
                trailing: const Icon(Icons.exit_to_app),
              ),
            ]),
          ),
        )
      ],
    );
  }
}
