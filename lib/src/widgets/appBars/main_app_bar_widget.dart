import 'package:flutter/material.dart';
import 'package:lectly_client_user_mobile/src/constants/colors.dart';
import 'package:lectly_client_user_mobile/src/widgets/branding/horizontal_logo_widget.dart';
import 'package:lectly_client_user_mobile/src/widgets/buttons/language_button_widget.dart';
import 'package:lectly_client_user_mobile/src/widgets/buttons/profile_button_widget.dart';

class MainAppBar extends AppBar {
  MainAppBar({Key? key})
      : super(
          key: key,
          backgroundColor: AppColors.transparent,
          elevation: 0,
          centerTitle: true,
          title: const HorizontalLogo(),
          actions: const [
            LanguageButton(),
          ],
          leading: const ProfileButton(),
        );
}
