import 'package:ecommercecourse/core/constant/imageassets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LogoAuthh extends StatelessWidget {
  const LogoAuthh({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        padding: const EdgeInsets.all(15),
        child: Lottie.asset(AppImageAssets.shops, height: 75));
  }
}
