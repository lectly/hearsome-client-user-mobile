import 'package:flutter/material.dart';

import '../constants/colors.dart';

class BackgroundContainer extends Container {
   BackgroundContainer({required Widget child}) : super(
    child:child ,
    width: double.infinity,
    height: double.infinity,
    decoration: BoxDecoration(
      gradient:AppColors.background
    ),
  );

}

