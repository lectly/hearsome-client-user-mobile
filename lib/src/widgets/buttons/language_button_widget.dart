import 'package:flutter/material.dart';

import 'dialog_button_widget.dart';

class LanguageButton extends StatelessWidget {
  const LanguageButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Image.asset('assets/images/globe.png'),
      onPressed: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return const DialogButton();
            });
      },
    );
  }
}
