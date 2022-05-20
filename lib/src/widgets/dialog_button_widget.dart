import 'package:flutter/material.dart';
import '../constants/colors.dart';

class DialogButton extends StatelessWidget {
  const DialogButton({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
        backgroundColor: AppColors.transparent,
        children: [
      Container(
        decoration: const BoxDecoration(
            color: AppColors.primaryColorDark,
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        height: 48,
        child: Row(
            children: [
          const SizedBox(
            width: 21.0,
          ),
          Image.asset(
            "assets/images/american_flag.png",
          ),
          SimpleDialogOption(
            onPressed: () {
              Navigator.pop(context, "English");
            },
            child: const Text(
              'English',
              style: TextStyle(
                color: AppColors.primaryColor,
                fontFamily: "Cairo",
                fontSize: 16.0,
              ),
            ),
          ),
          const SizedBox(
            width: 122.0,
          ),
          IconButton(
            icon: Image.asset('assets/images/arrow.png'),
            iconSize: 50,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ]),
      ),
      Container(
        decoration: const BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        height: 48,
        child: Row(
            children: [
              const SizedBox(
                width: 21.0,
              ),
              Image.asset(
                "assets/images/egyptian_flag.png",
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, "العربية");
                },
                child: const Text(
                  'العربية',
                  style: TextStyle(
                    color: AppColors.primaryColorDark,
                    fontFamily: "Cairo",
                    fontSize: 16.0,
                  ),
                ),
              ),
            ]),
      ),
    ]);
  }
}
