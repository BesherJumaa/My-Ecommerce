import 'package:ecommercecourse/controller/item_details_controller.dart';
import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/core/class/status_request.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../../core/constant/color.dart';

class PriceAndCountItems extends StatelessWidget {
  final void Function()? onAdd;
  final void Function()? onRemove;
  final String price;
  final String count;

  const PriceAndCountItems(
      {super.key,
      required this.onAdd,
      required this.onRemove,
      required this.price,
      required this.count});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: [
        Row(
          children: [
            IconButton(
              onPressed: onAdd,
              icon: const Icon(Icons.add),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(bottom: 8),
              width: 50,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColor.fourthColor)),
              child: Text(
                count,
                style: const TextStyle(fontSize: 25),
              ),
            ),
            IconButton(
              onPressed: onRemove,
              icon: const Icon(Icons.remove),
            ),
          ],
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            "$price \$",
            style: const TextStyle(color: AppColor.primaryColor, fontSize: 30),
          ),
        ),
      ],
    );
  }
}
