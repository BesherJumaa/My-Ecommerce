import 'package:flutter/material.dart';

class NoAccountAuth extends StatelessWidget {
  final String text;
  final String buttonText;
  final void Function()? onTap;
  const NoAccountAuth(
      {super.key, required this.text, required this.buttonText, this.onTap});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text),
        const Padding(padding: EdgeInsets.all(5)),
        InkWell(
          onTap: onTap,
          child: Text(
            buttonText,
            style: Theme.of(context).textTheme.headline1,
          ),
        )
      ],
    );
  }
}
