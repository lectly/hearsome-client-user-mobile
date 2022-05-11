import 'package:flutter/material.dart';
import '../constants/colors.dart';

class Appbar extends StatelessWidget {
  const Appbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            // FIXME: WHEN THE DIALOG IS FIXED, ENABLE THIS PIECE OF CODE
            // showDialog(
            //     context: context,
            //     builder: (BuildContext context) {
            //       return const DialogButton();
            //     });
          },
        ),
      ],
      // TODO: Update back button logic to support closing app
      //  if end of history tree
      leading: const BackButton(),
    );
  }
}
