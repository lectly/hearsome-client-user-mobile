import 'package:flutter/material.dart';
import '../constants/colors.dart';

class BackgroundContainer extends Container {
  BackgroundContainer({Key? key, required Widget child, AppBar? appBar})
      : super(
          key: key,
          decoration: BoxDecoration(gradient: AppColors.background),
          child: Scaffold(
            appBar: appBar,
            body: child,
            backgroundColor: AppColors.transparent,
          ),
        );
}
