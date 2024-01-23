import 'package:ecommercecourse/core/class/StatusRequest.dart';
import 'package:ecommercecourse/core/constant/imageassets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;

  const HandlingDataView(
      {super.key, required this.statusRequest, required this.widget});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return statusRequest == StatusRequest.loading
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                child: Text("Loading...."),
              ),
              Center(
                child: Lottie.asset(AppImageAssets.loading),
              ),
            ],
          )
        : statusRequest == StatusRequest.offlineFailure
            ? Center(child: Lottie.asset(AppImageAssets.offline))
            : statusRequest == StatusRequest.failure
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Center(
                        child: Text("Empty Data"),
                      ),
                      Center(
                        child:
                            Lottie.asset(AppImageAssets.noData, repeat: false),
                      ),
                    ],
                  )
                : statusRequest == StatusRequest.serverFailure
                    ? Center(
                        child: Lottie.asset(AppImageAssets.server),
                      )
                    : widget;
  }
}

class HandlingDataRequest extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;

  const HandlingDataRequest(
      {super.key, required this.statusRequest, required this.widget});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return statusRequest == StatusRequest.loading
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                child: Text("Loading...."),
              ),
              Center(
                child: Lottie.asset(AppImageAssets.loading),
                // CoolAlert.show(context: Get.overlayContext!, type: CoolAlertType.loading,)
              ),
            ],
          )
        : statusRequest == StatusRequest.offlineFailure
            ? Center(child: Lottie.asset(AppImageAssets.offline))
            : statusRequest == StatusRequest.serverFailure
                ? Center(
                    child: Lottie.asset(AppImageAssets.server),
                  )
                : statusRequest == StatusRequest.failure
                    ? widget
                    : widget;
  }
}
