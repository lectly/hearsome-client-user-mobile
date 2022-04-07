import 'package:flutter/material.dart';
import 'package:lectly_client_user_mobile/src/constants/colors.dart';

class DropDownList extends StatefulWidget {
  const DropDownList({Key? key}) : super(key: key);

  @override
  _DropDownListState createState() => _DropDownListState();
}

class _DropDownListState extends State<DropDownList> {
  final List<String> _languages = ["English", "العربية"];
  String selectedLanguage = "English";
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: Align(
        alignment: const Alignment(0.0, 0.9),
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
                "assets/images/language.png",
              ),
              const SizedBox(width: 8),
              DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  iconDisabledColor: AppColors.primaryColor,
                  iconEnabledColor: AppColors.primaryColor,
                  onChanged: (value) {
                    setState(() {
                      selectedLanguage = value!;
                    });
                  },
                  value: selectedLanguage,
                  items: _languages
                      .map((e) => DropdownMenuItem(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              e,
                              style: const TextStyle(fontSize: 18),
                            ),
                            value: e,
                          ))
                      .toList(),
                  selectedItemBuilder: (BuildContext context) => _languages
                      .map((e) => Center(
                            child: Text(
                              e,
                              style: const TextStyle(
                                  fontSize: 16,
                                  color: AppColors.primaryColor,
                                  fontFamily: "Cairo",
                                  fontWeight: FontWeight.bold),
                            ),
                          ))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}