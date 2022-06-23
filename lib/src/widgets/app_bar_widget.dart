import 'package:flutter/material.dart';
import 'package:lectly_client_user_mobile/src/widgets/language_button_widget.dart';
import '../constants/colors.dart';
import 'package:lectly_client_user_mobile/src/ui/splash/splash.dart';
import 'package:lectly_client_user_mobile/src/widgets/dialog_button_widget.dart';
import 'package:get/get.dart';

class Appbar extends StatelessWidget with PreferredSizeWidget {
  const Appbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
      leading:const BackButton(),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
