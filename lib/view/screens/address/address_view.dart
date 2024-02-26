import 'package:ecommercecourse/controller/address/view_address_controller.dart';
import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/data/model/address_model.dart';
import 'package:ecommercecourse/view/widgets/address/custom_address_items_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    AddressModel addressModel;
    return Scaffold(
      appBar: AppBar(
        title: Text("68".tr),
      ),
      // floatingActionButtonLocation: controller.lang == "en"? FloatingActionButtonLocation.startDocked : FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoutes.addressAdd);
        },
        child: const Icon(
          Icons.add,
          color: AppColor.white,
        ),
      ),
      body: GetBuilder<AddressViewController>(
          init: AddressViewController(),
          builder: (controller) {
            return HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: RefreshIndicator(
                onRefresh: () async {
                  controller.onInit();
                },
                child: Container(
                  child: ListView.builder(
                    itemCount: controller.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      addressModel = controller.data[index];
                      return CustomItemsAddressList(
                          name: addressModel.addressName!,
                          country: addressModel.addressCountry!,
                          governorate: addressModel.addressGovernorate!,
                          city: addressModel.addressCity!,
                          street: addressModel.addressStreet!,
                          onEdit: () {
                            controller.goToEdit(addressModel.addressId);
                          },
                          onRemove: () {
                            controller.deleteAddress(addressModel.addressId);
                          });
                    },
                  ),
                ),
              ),
            );
          }),
    );
  }
}