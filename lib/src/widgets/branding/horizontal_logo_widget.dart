import 'package:flutter/material.dart';

class HorizontalLogo extends StatelessWidget {
  const HorizontalLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/h-logo.png",
      width: 164,
    );
  }
}
