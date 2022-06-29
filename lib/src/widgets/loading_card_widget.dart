import 'package:flutter/material.dart';

import '../constants/colors.dart';
import 'package:get/get.dart';

class LoadingCard extends StatelessWidget {
  const LoadingCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      contentPadding: const EdgeInsets.all(8),
      content: Container(
        //apply margin and padding using Container Widget.
        padding: const EdgeInsets.fromLTRB(28, 0, 0, 0),
        child:  Text(
          "loading".tr,
          style: const TextStyle(
            color: AppColors.primaryColorDark,
            fontFamily: "Cairo",
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}
