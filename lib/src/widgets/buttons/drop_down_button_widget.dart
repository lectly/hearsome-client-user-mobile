import 'package:flutter/material.dart';
import 'package:lectly_client_user_mobile/src/constants/colors.dart';
import 'package:lectly_client_user_mobile/src/utils/localization_service.dart';

class DropDownList extends StatefulWidget {
  const DropDownList({Key? key}) : super(key: key);

  @override
  _DropDownListState createState() => _DropDownListState();
}

class _DropDownListState extends State<DropDownList> {
  String? selectedLanguage = LocalizationService.langs[LocalizationService.getSelectedLanguageIndex()];

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: Container(
        height: 36,
        width: 128,
        padding: const EdgeInsets.only(left: 12.0, right: 10.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(color: AppColors.primaryColor)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/globe.png",
              width: 16,
            ),
            const SizedBox(width: 8),
            DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                iconDisabledColor: AppColors.primaryColor,
                iconEnabledColor: AppColors.primaryColor,
                onChanged: (value) {
                  setState(() {
                    selectedLanguage = value!;
                    LocalizationService().changeLocale(value);
                  });
                },
                value: selectedLanguage,
                items: LocalizationService.langs.map((String lang) {
                  return DropdownMenuItem(
                      alignment: Alignment.bottomCenter,
                      value: lang,
                      child: Text(
                        lang,
                        style: const TextStyle(fontSize: 18),
                      ));
                }).toList(),
                selectedItemBuilder: (BuildContext context) =>
                    LocalizationService.langs.map((String lang) {
                  return Center(
                    child: Text(
                      lang,
                      style: const TextStyle(
                          fontSize: 16,
                          color: AppColors.primaryColor,
                          fontFamily: "Cairo",
                          fontWeight: FontWeight.bold),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
