import 'package:flutter/material.dart';

import '../../core/constant/color.dart';
import 'auth/customstextform.dart';

class CustomSearchBar extends StatelessWidget {
  final String? titleAppBar;
  final void Function()? onPressedIcon;
  final void Function()? onPressedSearch;
  const CustomSearchBar(
      {super.key, this.titleAppBar, this.onPressedIcon, this.onPressedSearch});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: [
        Expanded(
          child: CustomTextFormField(
            textBox: "",
            iconPrefix: IconButton(
              onPressed: onPressedSearch,
              icon: const Icon(Icons.search_outlined),
            ),
            hintText: titleAppBar,
          ),
        ),
        IconButton(
          onPressed: onPressedIcon,
          icon: const Icon(
            Icons.notifications_active_outlined,
          ),
          color: AppColor.primaryColor,
        ),
      ],
    );
  }
}
