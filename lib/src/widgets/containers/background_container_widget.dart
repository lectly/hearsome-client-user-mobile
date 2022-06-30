import 'package:flutter/material.dart';
import 'package:lectly_client_user_mobile/src/constants/colors.dart';

class BackgroundContainer extends Container {
  BackgroundContainer(
      {Key? key,
      required Widget child,
      AppBar? appBar,
      Widget? floatingActionButton})
      : super(
          key: key,
          decoration: BoxDecoration(gradient: AppColors.background),
          child: Scaffold(
            appBar: appBar,
            floatingActionButton: floatingActionButton,
            body: child,
            backgroundColor: AppColors.transparent,
          ),
        );
}
