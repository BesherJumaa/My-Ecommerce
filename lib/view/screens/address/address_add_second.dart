import 'package:ecommercecourse/controller/address/add_second_part_controller.dart';
import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/core/shared/custom_button.dart';
import 'package:ecommercecourse/core/shared/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/functions/valid_input.dart';

class AddressAddSecondPart extends StatelessWidget {
  const AddressAddSecondPart({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    AddressAddSecondPartController controller =
        Get.put(AddressAddSecondPartController());
    return Scaffold(
      appBar: AppBar(
        title: Text("88".tr),
      ),
      body: GetBuilder<AddressAddSecondPartController>(builder: (controller) {
        return HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: [
                CustomTextFormFields(
                  textBox: "96".tr,
                  mycontroller: controller.name,
                  iconPrefix: Icons.drive_file_rename_outline,
                ),
                CustomTextFormFields(
                  textBox: "92".tr,
                  mycontroller: controller.country,
                  validator: (String? val) {
                    print(val);
                    return validInput(val!, 2, 50, "");
                  },
                  iconPrefix: Icons.flag,
                ),
                CustomTextFormFields(
                  textBox: "93".tr,
                  mycontroller: controller.governorate,
                  validator: (String? val) {
                    print(val);
                    return validInput(val!, 2, 50, "");
                  },
                  iconPrefix: Icons.place,
                ),
                CustomTextFormFields(
                  textBox: "94".tr,
                  mycontroller: controller.city,
                  validator: (String? val) {
                    print(val);
                    return validInput(val!, 2, 50, "");
                  },
                  iconPrefix: Icons.location_city,
                  keyboardtype: TextInputType.multiline,
                ),
                CustomTextFormFields(
                  textBox: "95".tr,
                  mycontroller: controller.street,
                  validator: (String? val) {
                    print(val);
                    return validInput(val!, 2, 50, "");
                  },
                  iconPrefix: Icons.add_road,
                  keyboardtype: TextInputType.text,
                ),
                CustomButton(
                  textbutton: "61".tr,
                  onPressed: () {
                    controller.addAddress();
                  },
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
