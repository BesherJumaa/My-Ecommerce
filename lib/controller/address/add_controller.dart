import 'dart:async';
import 'package:ecommercecourse/core/class/status_request.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../core/constant/color.dart';
import '../../core/constant/routes.dart';

class AddAddressController extends GetxController {
  TextEditingController searchMap = TextEditingController();
  Completer<GoogleMapController> completerController =
      Completer<GoogleMapController>();
  MapType mapType = MapType.normal;
  CameraPosition? kGooglePlex;
  StatusRequest statusRequest = StatusRequest.loading;
  Position? position;
  List<Marker> markers = [];
  double? lat;
  double? long;
  // final GooglePlacesService placesService = GooglePlacesService();

  // StreamSubscription<Position>? positionStream;
  // GoogleMapController? controllerMap;

  var selectedMapType = MapType.normal;
  void changeMapType(MapType newMapType) {
    selectedMapType = newMapType;
    update();
  }

  List<MapType> mapTypes = [
    MapType.normal,
    MapType.satellite,
    MapType.hybrid,
    MapType.terrain,
  ];

  getCurrentLocation() async {
    statusRequest = StatusRequest.loading;
    position = await Geolocator.getCurrentPosition();
    kGooglePlex = CameraPosition(
        target: LatLng(position!.latitude, position!.longitude), zoom: 15.15);
    markers.add(Marker(
        markerId: const MarkerId("1"),
        position: LatLng(position!.latitude, position!.longitude)));
    lat = position!.latitude;
    long = position!.longitude;

    // positionStream = Geolocator.getPositionStream().listen((Position position) {
    //   markers.add(Marker(
    //       markerId: MarkerId("1"),
    //       position: LatLng(position.latitude, position.longitude)));
    //   controllerMap?.animateCamera(CameraUpdate.newCameraPosition(kGooglePlex));
    // });

    statusRequest = StatusRequest.none;
    update();
  }

  addMarker(LatLng latLng) {
    markers.clear();
    markers.add(Marker(markerId: const MarkerId("1"), position: latLng));
    lat = latLng.latitude;
    long = latLng.longitude;
    update();
  }

  requestPerLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Get.rawSnackbar(
          title: "60".tr,
          messageText: Text(
            "89".tr,
            style: const TextStyle(color: AppColor.white),
          ),
          backgroundColor: AppColor.thirdColor,
          isDismissible: true);
    }
    try {
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
    } catch (e) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.denied) {
      return Get.rawSnackbar(
          title: "60".tr,
          messageText: Text(
            "89".tr,
            style: const TextStyle(color: AppColor.white),
          ),
          backgroundColor: AppColor.thirdColor,
          isDismissible: true);
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Get.rawSnackbar(
          title: "60".tr,
          messageText: Text(
            "90".tr,
            style: const TextStyle(color: AppColor.white),
          ),
          backgroundColor: AppColor.thirdColor,
          isDismissible: true);
    }
  }

  goToSecondPart() {
    Get.toNamed(AppRoutes.addressAddSecondPart,
        arguments: {"lat": lat, "long": long});
  }

  final BitmapDescriptor searchResultIcon =
      BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure);

  // void searchPlaces(String query) async {
  //   try {
  //     final places = await placesService.searchPlaces(query);
  //     markers.clear();
  //     update();
  //     places.forEach((place) {
  //       final marker = Marker(
  //         markerId: MarkerId(place.placeId),
  //         position: LatLng(
  //             place.geometry!.location.lat, place.geometry!.location.lng),
  //         icon: searchResultIcon,
  //         infoWindow: InfoWindow(
  //           title: place.name,
  //           snippet: place.formattedAddress,
  //         ),
  //       );
  //       markers.add(marker);
  //     });
  //     update();
  //   } catch (e) {
  //     // Handle errors
  //   }
  // }

  @override
  void onInit() {
    requestPerLocation();
    completerController = Completer<GoogleMapController>();
    getCurrentLocation();
    update();
    super.onInit();
  }

  @override
  void onClose() {
    // positionStream?.cancel();
    super.onClose();
  }
}
//
// class GooglePlacesService {
//   final places =
//       GoogleMapsPlaces(apiKey: 'APIKEY');
//
//   Future<List<PlacesSearchResult>> searchPlaces(String query) async {
//     final response = await places.searchByText(query);
//     if (response.isOkay) {
//       print("resonse");
//       return response.results;
//     } else {
//       throw Exception('Failed to search places: ${response.errorMessage}');
//     }
//   }
// }
