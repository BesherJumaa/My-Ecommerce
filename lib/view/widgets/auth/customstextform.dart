import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? textBox;
  final String? hintText;
  final IconButton? iconPrefix;
  final TextEditingController? mycontroller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardtype;
  const CustomTextFormField({
    super.key,
    required this.textBox,
    this.hintText,
    this.iconPrefix,
    this.mycontroller,
    this.keyboardtype,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: const EdgeInsets.only(top: 15),
      child: TextFormField(
        keyboardType: keyboardtype,
        controller: mycontroller,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validator,
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[200],
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
            label: Container(
                margin: const EdgeInsets.symmetric(horizontal: 7),
                child: Text(textBox!)),
            hintStyle: const TextStyle(fontSize: 14),
            hintText: hintText,
            suffixIcon: iconPrefix,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            )),
      ),
    );
  }
}
