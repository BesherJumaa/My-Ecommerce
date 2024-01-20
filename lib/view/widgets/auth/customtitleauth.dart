import 'package:flutter/material.dart';

class CustomTitleAuth extends StatelessWidget {
  final String? title;
  const CustomTitleAuth({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      title!,
      style: Theme.of(context).textTheme.headline3,
    );
  }
}
