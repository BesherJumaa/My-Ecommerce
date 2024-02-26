import 'package:ecommercecourse/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String textbutton;
  final void Function()? onPressed;
  const CustomButton({Key? key, required this.textbutton, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: double.infinity,
      child: MaterialButton(
        color: AppColor.primaryColor,
        textColor: Colors.white,
        onPressed: onPressed,
        child: Text(textbutton,
            style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }
}
