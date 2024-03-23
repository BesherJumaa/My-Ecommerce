import 'package:ecommercecourse/view/screens/homeScreens/myfavorite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/color.dart';
import '../screens/notification.dart';
import 'auth/customs_text_form.dart';

class CustomSearchBar extends StatelessWidget {
  final String? titleAppBar;

  final void Function(String)? onChanged;
  final void Function()? onPressedSearch;
  final TextEditingController? myController;
  const CustomSearchBar({
    super.key,
    this.titleAppBar,
    this.onPressedSearch,
    this.onChanged,
    this.myController,
  });
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: CustomTextFormField(
            onEditingComplete: onPressedSearch,
            mycontroller: myController,
            textBox: "",
            iconPrefix: IconButton(
              onPressed: onPressedSearch,
              icon: const Icon(Icons.search_outlined),
            ),
            hintText: titleAppBar,
            onChanged: onChanged,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: IconButton(
            onPressed: () {
              Get.to(const Notifications(),
                  duration: const Duration(seconds: 2),
                  transition: Transition.upToDown);
            },
            icon: const Icon(
              Icons.notifications_active_outlined,
            ),
            color: AppColor.primaryColor,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: IconButton(
            onPressed: () {
              Get.to(const MyFavorite(),
                  duration: const Duration(seconds: 2),
                  transition: Transition.upToDown);
            },
            icon: const Icon(
              Icons.favorite_border_outlined,
            ),
            color: AppColor.primaryColor,
          ),
        ),
      ],
    );
  }
}
