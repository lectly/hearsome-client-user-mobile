import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../utils/localization_service.dart';

var languages = LocalizationService.langs.toList();
var icons = [
  "assets/images/american_flag.png",
  "assets/images/egyptian_flag.png"
];

class DialogButton extends StatefulWidget {
  const DialogButton({Key? key}) : super(key: key);
  @override
  _DialogButtonState createState() => _DialogButtonState();
}

class _DialogButtonState extends State<DialogButton> {
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(backgroundColor: AppColors.transparent, children: [
      Container(
        decoration: const BoxDecoration(
            color: AppColors.primaryColorDark,
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        height: 48,
        child: SimpleDialogOption(
          onPressed: () => Navigator.pop(context),
          child: Row(
            children: [
              Image.asset(
                  icons[LocalizationService.getSelectedLanguageIndex()]),
              const SizedBox(width: 8),
              Text(
                languages[LocalizationService.getSelectedLanguageIndex()],
                style: const TextStyle(
                  color: AppColors.primaryColor,
                  fontFamily: "Cairo",
                  fontSize: 16.0,
                ),
              ),
              const Spacer(),
              Image.asset('assets/images/arrow.png'),
            ],
          ),
        ),
      ),
      Container(
        decoration: const BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        height: 48,
        child: SimpleDialogOption(
          onPressed: () {
            LocalizationService().changeLocale(languages[
                (LocalizationService.getSelectedLanguageIndex() + 1) % 2]);
            Navigator.pop(context);
          },
          child: Row(
            children: [
              Image.asset(icons[
                  (LocalizationService.getSelectedLanguageIndex() + 1) % 2]),
              const SizedBox(width: 8),
              Text(
                languages[
                    (LocalizationService.getSelectedLanguageIndex() + 1) % 2],
                style: const TextStyle(
                  fontFamily: "Cairo",
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
