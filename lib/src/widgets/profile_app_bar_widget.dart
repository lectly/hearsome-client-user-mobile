import 'package:flutter/material.dart';
import 'package:lectly_client_user_mobile/src/widgets/language_button_widget.dart';
import '../constants/colors.dart';
import 'package:get/get.dart';

class ProfileAppBar extends AppBar {
  ProfileAppBar({Key? key})
      : super(
          key: key,
          backgroundColor: AppColors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "profile".tr,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.primaryColor,
              fontFamily: "Cairo",
              fontSize: 24.0,
            ),
          ),
          actions: const [
            LanguageButton(),
          ],
          leading: const BackButton(),
        );
}
