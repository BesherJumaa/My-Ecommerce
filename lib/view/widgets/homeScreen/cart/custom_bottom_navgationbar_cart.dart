// ignore_for_file: prefer_const_constructors

import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/shared/custom_button.dart';
import 'package:ecommercecourse/core/shared/custom_text_form_field.dart';
import 'package:ecommercecourse/view/widgets/homeScreen/cart/button_coupon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'button_cart.dart';

class BottomNavigationBarCart extends StatelessWidget {
  final String price;
  final String shipping;
  final String discount;
  final String totalPrice;
  final void Function()? onApply;
  final void Function()? onPlaceOrder;
  final TextEditingController controllerCoupon;
  const BottomNavigationBarCart(
      {Key? key,
      required this.price,
      required this.shipping,
      required this.totalPrice,
      required this.onApply,
      required this.onPlaceOrder,
      required this.controllerCoupon,
      required this.discount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: TextFormField(
                  style: const TextStyle(
                    color: AppColor.primaryColor,
                    fontSize: 18,
                  ),
                  textDirection: TextDirection.ltr,
                  controller: controllerCoupon,
                  decoration: InputDecoration(
                    isDense: true,
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                    // hintStyle: const TextStyle(fontSize: 14),
                    hintText: "98".tr,
                    border: OutlineInputBorder(
                        // borderRadius: BorderRadius.circular(30),
                        ),
                  ),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: CustomButtonCoupon(
                    textbutton: "99".tr,
                    onPressed: onApply,
                  ))
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border.all(color: AppColor.primaryColor),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Text("71".tr, style: TextStyle(fontSize: 18))),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text("$price \$", style: TextStyle(fontSize: 18)))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Text("100".tr, style: TextStyle(fontSize: 18))),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child:
                          Text("$discount \$", style: TextStyle(fontSize: 18)))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Text("70".tr, style: TextStyle(fontSize: 18))),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child:
                          Text("$shipping \$", style: TextStyle(fontSize: 18)))
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Text("72".tr,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColor.primaryColor))),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text("$totalPrice \$",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColor.primaryColor)))
                ],
              ),
              SizedBox(height: 10),
              CustomButtonCart(
                textbutton: "103".tr,
                onPressed: onPlaceOrder,
              )
            ],
          ),
        ),
      ],
    );
  }
}
