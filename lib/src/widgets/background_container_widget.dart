import 'package:flutter/material.dart';

import '../constants/colors.dart';

class BackgroundContainer extends Container {
  BackgroundContainer({Key? key, required Widget child})
      : super(
          key: key,
          child: child,
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(gradient: AppColors.background),
        );
}
