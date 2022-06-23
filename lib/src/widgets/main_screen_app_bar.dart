import 'package:flutter/material.dart';
import 'package:lectly_client_user_mobile/src/ui/profile/profile.dart';
import 'package:lectly_client_user_mobile/src/widgets/horizontal_logo_widget.dart';
import 'package:lectly_client_user_mobile/src/widgets/language_button_widget.dart';
import '../constants/colors.dart';



class Appbar extends StatelessWidget {
  const Appbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: AppColors.transparent,
        elevation: 0,
        title: const HorizontalLogo(),
        actions: const [
          LanguageButton(),
        ],
        leading:
            IconButton(
              icon: Image.asset('assets/images/user.png'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                        const ProfileScreen()));
              },
            ),
    );
  }
}
