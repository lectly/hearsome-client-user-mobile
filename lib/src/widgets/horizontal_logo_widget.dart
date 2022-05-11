import 'package:flutter/material.dart';

import '../constants/colors.dart';

class HorizontalLogo extends StatelessWidget {
  const HorizontalLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.ltr,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
          Image.asset(
            "assets/images/horizontal_logo.png",
          ),
          const SizedBox(width: 10),
          const Text(
            "hearsome",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.primaryColor,
              fontFamily: "Cairo",
              fontSize: 24.0,
            ),
          ),
        ]));
  }
}
