import 'package:ecommercecourse/controller/address/add_controller.dart';
import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressAdd extends StatelessWidget {
  const AddressAdd({super.key});

  @override
  Widget build(BuildContext context) {
    AddAddressController controller = Get.put(AddAddressController());
    // TODO: implement build
    return GetBuilder<AddAddressController>(builder: (controller) {
      return Scaffold(
        floatingActionButton: MaterialButton(
          onPressed: () {
            controller.goToSecondPart();
          },
          color: AppColor.primaryColor,
          textColor: AppColor.white,
          child: Text(
            "8".tr,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: AppBar(title: Text("88".tr), actions: [
          DropdownButton<MapType>(
            hint: Text(
              "91".tr,
              style: const TextStyle(color: AppColor.white),
            ),
            iconEnabledColor: AppColor.white,
            iconDisabledColor: AppColor.white,
            dropdownColor: AppColor.primaryColor,
            items: controller.mapTypes.map((mapType) {
              return DropdownMenuItem(
                value: mapType,
                child: Text(
                  mapType.toString().split('.').last.tr,
                  style: const TextStyle(color: AppColor.white),
                ),
              );
            }).toList(),
            onChanged: (newValue) {
              controller.changeMapType(newValue!);
            },
            value: controller.selectedMapType,
          ),
        ]),
        body: Container(
          child: HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Column(
              children: [
                // CustomSearchBar(
                //   titleAppBar: "Search In Map",
                //   myController: controller.searchMap,
                //   onPressedIcon: () {
                //     controller.searchPlaces(controller.searchMap.text);
                //   },
                // ),
                if (controller.kGooglePlex != null)
                  Expanded(
                    child: GoogleMap(
                      initialCameraPosition: controller.kGooglePlex!,
                      mapType: controller.selectedMapType,
                      markers: controller.markers.toSet(),
                      onTap: (latLng) {
                        controller.addMarker(latLng);
                      },
                      onMapCreated: (GoogleMapController controllerMap) {
                        controller.completerController.complete(controllerMap);
                      },
                    ),
                  ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
