import 'package:flutter/material.dart';

import '../constants/colors.dart';

class HorizontalLogo extends Row {
  HorizontalLogo({Key? key})
      : super(key: key, mainAxisAlignment: MainAxisAlignment.center, children: [
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
        ]);
}
