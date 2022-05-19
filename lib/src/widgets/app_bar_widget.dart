import 'package:flutter/material.dart';
import '../constants/colors.dart';
import 'package:lectly_client_user_mobile/src/ui/splash/splash.dart';
import 'package:lectly_client_user_mobile/src/widgets/dialog_button_widget.dart';

class Appbar extends StatelessWidget {
  const Appbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DialogButton dialogButton = DialogButton();
    return AppBar(
      backgroundColor: AppColors.transparent,
      elevation: 0,
      centerTitle: true,
      title: const Text(
        "Profile",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.primaryColor,
          fontFamily: "Cairo",
          fontSize: 24.0,
        ),
      ),
      actions: [
        IconButton(
          icon: Image.asset('assets/images/globe.png'),
          iconSize: 50,
          onPressed: () {

            showDialog(
                 context: context,
                 builder: (BuildContext context) {
                   return const DialogButton();
                 });
          },
        ),
      ],

      leading: IconButton(
        icon: Image.asset('assets/images/back.png'),
        iconSize: 50,
        onPressed: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const SplashScreen())); //it should be mainscreen but code is not merged yet
        },
      ),
    );
  }
}
